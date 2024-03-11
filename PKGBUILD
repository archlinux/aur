# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=bmv
pkgver=0.0.14
pkgrel=1
pkgdesc='drop-in mv replacement with bulk moving support'
url='https://github.com/abenz1267/bmv'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('bmv')
provides=('bmv')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c035ece114b34f29293bfa8211824cd2e2b09f52645dbc54ab5ea8f1900888a0')
b2sums=('eb951b16f55206daa02c784f6ea9f0157a2b3ecf576970089992d57c44ee95a95b69536cc1cb7df1dda3e3859a04869532c4d416fea4a7e9b73d9a9074fd8fc5')

build() {
  cd ${pkgname}-${pkgver}

  go build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 bmv -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
