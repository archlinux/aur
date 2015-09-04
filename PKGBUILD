# Maintainer: Thomas Glamsch <thomas.glamsch@gmail.com>
# Contributor: Alexander Kratzsch <alexander-kratzsch at web dot de>
# Contributor: Peter Hoeg <first name at last name dot com>

_revision=2150
pkgname=koma-script
pkgver=3.18.${_revision}
pkgrel=0
pkgdesc="A versatile bundle of LaTeX2e document classes and packages"
arch=("any")
url="http://www.komascript.de/"
license=('LPPL')
depends=('texlive-latexextra')
install=koma-script.install
makedepends=('unzip')
source=("http://sourceforge.net/projects/koma-script/files/KOMA-Script/koma-script-${_revision}.zip")
sha1sums=('acc976e8d2a073b4fe1ab772466e0f35337fe2ee')
noextract=("koma-script-${_revision}.zip")

build() {
  cd "$srcdir/"

  unzip -q "koma-script-${_revision}.zip"
}

package() {
  cd "$srcdir/"

  install -m775 -d "$pkgdir/usr/share/texmf"

  cp -R doc/ tex/ source/ "$pkgdir/usr/share/texmf"
  chmod -R 755 "$pkgdir/usr"
}
