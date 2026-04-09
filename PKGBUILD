# Maintainer: motorrin
pkgname=arch-smart-update
pkgver=3.5.0
pkgrel=1
pkgdesc="Not sure when to update Arch Linux or its derivative? This script will help you decide!"
arch=('any')
url="https://github.com/motorrin/Arch_Smart_Update"
license=('MIT')
depends=('bash' 'python' 'pacman' 'tar' 'gawk' 'coreutils' 'psmisc' 'curl')
optdepends=(
    'reflector: for Arch Linux mirror updates'
    'cachyos-rate-mirrors: for CachyOS mirror updates'
    'eos-rankmirrors: for EndeavourOS mirror updates'
    'eos-update: for EndeavourOS core updates'
    'yay: AUR helper support'
    'paru: AUR helper support'
    'topgrade: for comprehensive system updates'
    'fakeroot: for running the background update checker without sudo'
    'libnotify: for desktop notifications in daemon mode'
)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8a7e326f72e7194e39a5c2022c1ea1789ed4965d4bc76bf88311719f5c3e0b0e')

package() {
    cd "Arch_Smart_Update-${pkgver}"

    install -Dm755 "arch-smart-update.sh" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
