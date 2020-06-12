# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-styles
pkgver=1.7
pkgrel=1
pkgdesc="Four consistent styles across light-weight WMs for XDE"
arch=('any')
url="http://github.com/bbidulock/xde-styles"
groups=('xde')
license=('CCPL:by-sa')
makedepends=('git')
depends=('m4')
optdepends=('xdg-launch: for key bindings'
            'xde-menu: for root menus'
            'xde-ctools: for window menus'
            'xde-session: for key bindings')
source=("https://github.com/bbidulock/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.lz")
sha256sums=('e4e80f791b1211c392a5d25df6568a71c875fb150e58774ed942ef3bf2d29819')

build() {
 cd $pkgname-$pkgver
 ./configure
 make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim: et sw=2:
