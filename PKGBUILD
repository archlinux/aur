# Maintainer: Muhammad Dhiyaul Atha <bangkah@aur>

pkgname=atha
pkgver=2.2.3
pkgrel=1
pkgdesc="Simple and fast Arch Linux package manager wrapper built on top of pacman"
arch=('any')
url="https://github.com/Bangkah/Atha"
license=('MIT')
depends=(
    'bash'
    'pacman'
    'sudo'
    'git'
    'base-devel'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Bangkah/Atha/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "Atha-${pkgver}"

    install -Dm755 atha "${pkgdir}/usr/bin/atha"

    install -d "${pkgdir}/usr/lib/atha"
    cp -dr --no-preserve=ownership commands "${pkgdir}/usr/lib/atha/"

    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}