# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=ameba
pkgver=0.10.0
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
  'd6daa15b6fc5326b55140120408f0ae7510d918623fc55acf298018150b6ab43'
)

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr" install

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
