pkgname=dumpr
pkgver=1.0.3
pkgrel=1
pkgdesc='Turn a project directory into a readable text dump'
arch=('x86_64' 'aarch64')
url='https://github.com/iktrnch/dumpr'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("dumpr-${pkgver}.tar.gz::https://github.com/iktrnch/dumpr/archive/refs/tags/v1.0.3.tar.gz")
sha256sums=('71e1ac6fef68c41d9ca19e7670b1aacd5446571ea31f166737e557c2d45893c2')

build() {
  cd "${srcdir}/dumpr-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/dumpr-${pkgver}"
  install -Dm755 target/release/dumpr "${pkgdir}/usr/bin/dumpr"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
