# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Peter Hoeg <first name at last name dot com>
# Contributor: Thomas Glamsch <thomas.glamsch@gmail.com>
# Contributor: Alexander Kratzsch <alexander-kratzsch at web dot de>

_revision=3610
pkgname=koma-script
pkgver=3.32.${_revision}
pkgrel=1
pkgdesc="A versatile bundle of LaTeX2e document classes and packages"
arch=("any")
url="http://www.komascript.de/"
license=('LPPL')
depends=('texlive-core' 'texlive-latexextra')
makedepends=('unzip')
source=("http://sourceforge.net/projects/koma-script/files/KOMA-Script/koma-script-${_revision}.zip")
sha512sums=('b58d781f29ad6f4c77c9ce3528e61fe6e08c7f59e631e24fb6b1986c59c951df5d01e57b2d37bad45de352636659e2fa547f06f0f3da179d2bc83e47b9c223cd')
noextract=("koma-script-${_revision}.zip")
install=texlive.install

prepare() {
  unzip koma-script-${_revision}.zip
}

package() {
  cd "$srcdir/"

  install -m775 -d "$pkgdir/usr/share/texmf"
  cp -R doc/ tex/ "$pkgdir/usr/share/texmf"
}
