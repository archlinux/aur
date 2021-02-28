# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=ameba
pkgver=0.14.0
pkgrel=2
pkgdesc="A static code analysis tool for Crystal"
arch=('x86_64')
url='https://github.com/crystal-ameba/ameba'
license=('MIT')
depends=('gc' 'gcc-libs' 'libevent' 'libyaml' 'make' 'pcre')
makedepends=('crystal>=0.35.0' 'shards')
source=(
  "${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  '1f2a8808874524306aa0189683e94424e6fcc95ef8dd4535a5df192c3a92ae8b'
)

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr" CRFLAGS=--release install

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
