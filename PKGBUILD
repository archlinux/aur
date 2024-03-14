# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.0.11
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
arch=('x86_64')
license=('MIT')
makedepends=('go')
depends=('gtk4-layer-shell')
conflicts=('walker')
provides=('walker')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('540368d5abdcb23ca4565a0af38287ab90370b809cd7433de9c31b8b54a81a3c')
b2sums=('9d7992723c5f05c5fe59f62fc370ff114f2519ec7528b9f5e25134289cfcedece7d5e2367ab8c46fbe059b1e7db64a197557d3d582b7295dcd72b60b7259c5de')

build() {
  cd ${pkgname}-${pkgver}

  go build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
