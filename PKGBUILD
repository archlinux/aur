# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
# Previous maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=ameba
pkgver=1.3.0
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
sha256sums=('9110cf8697ad82e929ab3649bb49e739f42f62db4661f6486d31f029d88cf910')

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr" CRFLAGS=--release install

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
