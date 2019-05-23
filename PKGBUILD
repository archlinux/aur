# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=ameba
pkgver=0.9.1
pkgrel=1
pkgdesc="A static code analysis tool for Crystal"
arch=('x86_64')
url='https://github.com/veelenga/ameba'
license=('MIT')
depends=('crystal' 'make')
makedepends=('shards')
source=(
  "${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  'd08fea919e402d7ee8fd48cfb8c304997cf68a338b5dfdb4a6a232de9dd9b0d1'
)

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr" install

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
