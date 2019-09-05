# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-styles
pkgver=1.3
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
sha256sums=('814fe5d76b776215ca4066ca8543ef83f27b08e591da03551f1d49ef31824eeb')

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
