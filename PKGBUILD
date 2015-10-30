# Maintainer: Christian Schwarz <me@cschwarz.com>
pkgname=gmux_backlight
_commit="ebd45a90dd6be962f310dc4517147bced792c112"
pkgrel=1
pkgdesc="Modify brightness of displays attached to a gmux."
arch=("any")
url="https://github.com/problame/gmux_backlight"
license=('BSD')
depends=()
makedepends=('git' "asciidoc")
source=("git+https://github.com/problame/gmux_backlight#commit=${_commit}")
md5sums=('SKIP')
#generate with 'makepkg -g'

pkgver=0.1
pkgver() {
  cd "$srcdir/$pkgname"
  git describe
}

build() {
  
  cd "$srcdir/$pkgname"
  make build
  make docs

}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install  
}

# vim:set ts=2 sw=2 et:
