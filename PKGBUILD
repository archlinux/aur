# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.0.28
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
sha256sums=('c66ce5ee0b5e01f9d5c54f78021554022e0483c36f36d4534a06600f7b6e72f3')
b2sums=('aff6415cd3f80214244c4f9d52a62e6d5ec9bf1eecab9b2f4a7e7bb4e0ecfa0783a77b60d61f2956d7856214248d00000b2c5486729795c2425faf118696aa1f')

build() {
  cd ${pkgname}-${pkgver}

  go build -x
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
