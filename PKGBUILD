# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=ameba
pkgver=0.11.0
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
  'b402f56a74b7e4cc951be0d5da3ac466e366a1d8b4f3adfe852884375173fa68'
)

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr" install

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
