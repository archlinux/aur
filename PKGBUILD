# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
# Previous maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=ameba
pkgver=1.5.0
pkgrel=1
pkgdesc="A static code analysis tool for Crystal"
arch=('x86_64')
url='https://github.com/crystal-ameba/ameba'
license=('MIT')
depends=('gc' 'gcc-libs' 'libevent' 'libyaml' 'make' 'pcre')
makedepends=('crystal>=1.5.0' 'shards')
source=(
  "${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=('c8f9b6c7f832a8e939f8f30b83ef960c25f66a0927d6e6461f2d0b20f1880476')

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr" CRFLAGS=--release install

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
