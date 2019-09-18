# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=ameba
pkgver=0.10.1
pkgrel=1
pkgdesc="A static code analysis tool for Crystal"
arch=('x86_64')
url='https://github.com/veelenga/ameba'
license=('MIT')
depends=('crystal>=0.29.0' 'make')
makedepends=('shards')
source=(
  "${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  '9c066ff9983ac6607b527f6004dd024be025cd1b2573faf78258cf071e22ffe4'
)

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr" install

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
