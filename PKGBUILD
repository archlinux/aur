# Maintainer: Muhammad Dhiyaul Atha <bangkah@aur>

pkgname=atha
pkgver=3.0.0
pkgrel=1
pkgdesc="Safety and workflow layer for pacman"
arch=('x86_64' 'aarch64')
url="https://github.com/Bangkah/Atha"
license=('MIT')
depends=('pacman' 'sudo' 'git')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Bangkah/Atha/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "Atha-${pkgver}"

    cargo build --release
    install -Dm755 target/release/atha "${pkgdir}/usr/bin/atha"

    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
