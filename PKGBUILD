# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
# Previous maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=ameba
pkgver=1.4.1
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
sha256sums=('63961d7c4d6145b185b5ee581e35ac6810a749934f5e2acbf1486f1d4eb76ca3')

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr" CRFLAGS=--release install

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
