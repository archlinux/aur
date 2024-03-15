# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.0.14
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
sha256sums=('d8189996ed5621536d36e77ee8604abf7b0f4f0ef7bebd374cb685aecf53ffe5')
b2sums=('6c948c90132b6c873e5d1cf4c69527750a245b41444f5c9c90a858d2aad9fc6d2767483b37b5a3852cd652d179c348fd63471aaa4ad971aeffc80b9537cd0ecd')

build() {
  cd ${pkgname}-${pkgver}

  go build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
