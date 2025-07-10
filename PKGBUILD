# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=hyprsunset-util
pkgver=0.0.2
pkgrel=1
pkgdesc='hyprsunset utility managing screen temperature'
url='https://github.com/abenz1267/hyprsunset-util'
arch=('x86_64')
license=('MIT')
makedepends=('go')
conflicts=('hyprsunset-util')
provides=('hyprsunset-util')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3cb23b61e74bef3503e9a3c53c028e278d08fef0494d46b1e0769b6af71f504d')
b2sums=('904e2a4b56b76910efc01c84c021bc5a234093befc4404bed0c709dc19f8c3900cea016b4659fb39adf28355325c77d67f3bdcea7b70afd7489ab3129139b287')

build() {
  cd ${pkgname}-${pkgver}

  go build -x -o hyprsunset-util
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 hyprsunset-util -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
