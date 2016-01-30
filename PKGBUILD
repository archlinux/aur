# Maintainer: Campbell Barton <ideasman42@gmail.com>
_pkgname=triskweline-code-font
pkgname=$_pkgname
pkgver=4.b516857
pkgrel=1
pkgdesc="A monospaced bitmap font, modified from Triskweline for better code readability."
arch=('any')
url="https://github.com/ideasman42/triskweline-code-font"
license=('CC0')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=("$pkgname.install")
source=("git://github.com/ideasman42/$_pkgname.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "$srcdir/$_pkgname"

  install -d "$pkgdir/usr/share/fonts/local"
  install -m644 bdf/*.bdf "$pkgdir/usr/share/fonts/local/"
}

