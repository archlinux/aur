# Maintainer: motorrin
pkgname=arch-smart-update
pkgver=3.16.4
pkgrel=2
pkgdesc="Not sure when to update Arch Linux or its derivative? This script will help you decide."
arch=('any')
url="https://github.com/motorrin/arch_smart_update"
license=('MIT')
depends=('bash' 'python' 'pacman' 'tar' 'gawk' 'coreutils' 'curl' 'zstd')
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
    'psmisc: for lock detection using fuser'
)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ce0e70deb916a4d6d763c5c14201c01a651f56bedb5c6b0b9e2a235aaa8d1834')

package() {
    cd "arch_smart_update-${pkgver}"

    install -Dm755 "arch-smart-update.sh" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
