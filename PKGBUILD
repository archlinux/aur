# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=goreman-bin
pkgver=0.3.16
pkgrel=1
pkgdesc='Procfile-based process manager (like foreman, written in Go)'
arch=('x86_64' 'aarch64')
url='https://github.com/mattn/goreman'
license=('MIT')
depends=('glibc')
provides=('goreman')
conflicts=('goreman')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/goreman_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/goreman_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('7f0a65cf33540ff20b0a4bea712fa7d86525127b9dbf9b1a66c95b3c1d1ab84e')
sha256sums_aarch64=('23ba81b247470c2d4fed17df90a8f2c3d5edf251960e4fc066edf6d8c68fb1c8')

package() {
    cd "goreman_v${pkgver}_linux_$([ "$CARCH" = x86_64 ] && echo amd64 || echo arm64)"
    install -Dm755 goreman "${pkgdir}/usr/bin/goreman"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
