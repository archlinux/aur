# Maintainer: Franz König <9bcfbc1ca230857ba09584697f20708a@kngfr.de>
pkgname=hexedit0r
pkgver=1.0.13.g9831044
pkgrel=1
pkgdesc="personal fork of hexedit, a ncurses hexeditor"
arch=('any')
url="http://prigaux.chez.com/hexedit.html"
license=('GPL2')
depends=('glibc' 'ncurses')
makedepends=('make')
conflicts=('hexedit')
source=('git+https://github.com/rofl0r/hexedit0r')
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -e 's/^v//g' -e 's/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make prefix="$pkgdir/usr/" install

  install -D COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

# vim:set ts=2 sw=2 et:
