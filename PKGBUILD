pkgname=dumpr
pkgver=1.0.2
pkgrel=1
pkgdesc='Turn a project directory into a readable text dump'
arch=('x86_64' 'aarch64')
url='https://github.com/iktrnch/dumpr'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("dumpr-${pkgver}.tar.gz::https://github.com/iktrnch/dumpr/archive/refs/tags/v1.0.2.tar.gz")
sha256sums=('9f383cfc4d7024a7372f0d1720a410f7a23d6eb793a53ea7ec9aebbcaf721b3a')

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
