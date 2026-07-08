# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=goreman-bin
pkgver=0.3.19
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
sha256sums_x86_64=('3a295da503fc2113620c723f2be26f1322818f53575cf85c31a605d76e97f585')
sha256sums_aarch64=('c09b580cd8c1f8a3e90928e02608f3ead02c87656368261f7f0514f724507b93')

package() {
    cd "goreman_v${pkgver}_linux_$([ "$CARCH" = x86_64 ] && echo amd64 || echo arm64)"
    install -Dm755 goreman "${pkgdir}/usr/bin/goreman"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
