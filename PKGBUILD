# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=goreman-bin
pkgver=0.3.17
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
sha256sums_x86_64=('5e91144d6f4d26eb73c3e8cbe2a4fbe1719e71b6bb8778aeab9aae40cbb49e57')
sha256sums_aarch64=('14b92317e603326ce9989e5f59107bfa5916ed6df114a74186e9f3d054306e69')

package() {
    cd "goreman_v${pkgver}_linux_$([ "$CARCH" = x86_64 ] && echo amd64 || echo arm64)"
    install -Dm755 goreman "${pkgdir}/usr/bin/goreman"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
