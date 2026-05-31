# Maintainer: motorrin
pkgname=arch-smart-update
pkgver=3.12.3
pkgrel=1
pkgdesc="Not sure when to update Arch Linux or its derivative? This script will help you decide."
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
sha256sums=('e7889d4241b87bdcd1b3dfdf72f4aa13a0b47f77caf3904c0f7d6c785522d982')

package() {
    cd "Arch_Smart_Update-${pkgver}"

    install -Dm755 "arch-smart-update.sh" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
