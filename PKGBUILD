# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.0.23
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
sha256sums=('4ea4c099cb1e1be7933d9f23e9e4ab89cb211718481c32e7a98a80055cfda332')
b2sums=('db1432e2302350aec4b1232305a494155cc2ae54af29be62af89706eaf6ea6bee9e46ccdc9a94edbaef918c8fb5d20acf2dafa2ca788c1be577053ef6ded76a4')
4ea4c099cb1e1be7933d9f23e9e4ab89cb211718481c32e7a98a80055cfda332  walker-0.0.23.tar.gz
db1432e2302350aec4b1232305a494155cc2ae54af29be62af89706eaf6ea6bee9e46ccdc9a94edbaef918c8fb5d20acf2dafa2ca788c1be577053ef6ded76a4  walker-0.0.23.tar.gz

build() {
  cd ${pkgname}-${pkgver}

  go build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
