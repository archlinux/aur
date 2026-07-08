# Maintainer: motorrin
pkgname=arch-smart-update
pkgver=3.19.1
pkgrel=1
pkgdesc="This script helps you decide when to update Arch Linux or its derivatives."
arch=('any')
url="https://github.com/motorrin/arch-smart-update"
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
sha256sums=('a8e1adbaab9dc487c6962f8601fb9e95d84c9c2b73cc082bc4fb014d82e74e3b')

package() {
    cd "arch-smart-update-${pkgver}"

    install -Dm755 "arch-smart-update.sh" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
