# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.0.19
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
sha256sums=('483318f2b5b60405f0f5774f505c32863ad23dd5d1576e19446ede3caf63bbbd')
b2sums=('1eb6b16ead9c4ecd282da7e1e71e5b0f48220fb151e1d415f4d11d807efb5e8cc9b4a4065e26ab79e620cf42103ab711f3f74b04dfd46f5d577f4c71d6e4a999')

build() {
  cd ${pkgname}-${pkgver}

  go build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
