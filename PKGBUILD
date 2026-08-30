# Maintainer: motorrin
pkgname=arch-smart-update
pkgver=3.28.5
pkgrel=1
pkgdesc="Intelligent update advisor and wrapper for Arch Linux and derivatives"
arch=('any')
url="https://github.com/motorrin/arch-smart-update"
license=('MIT')
depends=('bash' 'python' 'pacman' 'pacman-contrib' 'tar' 'gawk' 'coreutils' 'curl' 'zstd' 'grep' 'sed')
optdepends=(
    'rate-mirrors: for fast Arch Linux mirror ranking (primary)'
    'reflector: for Arch Linux mirror ranking (fallback)'
    'rebuild-detector: for detecting foreign AUR packages requiring rebuild (checkrebuild)'
    'cachyos-rate-mirrors: for CachyOS mirror updates'
    'eos-rankmirrors: for EndeavourOS mirror updates'
    'eos-update: for EndeavourOS core updates'
    'cachy-update: for CachyOS core updates'
    'arch-update: for general Arch core updates'
    'yay: AUR helper support'
    'paru: AUR helper support'
    'pikaur: AUR helper support'
    'aura: AUR helper support'
    'rua: AUR helper support'
    'trizen: AUR helper support'
    'pacaur: AUR helper support'
    'pakku: AUR helper support'
    'topgrade: for comprehensive system updates'
    'fakeroot: for running the background update checker without sudo'
    'libnotify: for desktop notifications in daemon mode'
    'util-linux: for terminal log capture (script), state locking (flock) and detached execution (setsid)'
    'xdg-utils: for opening Arch News links in default browser (xdg-open)'
    'xdg-terminal-exec: for spawning default desktop terminal from notifications'
    'flatpak: for cleaning unused runtimes during post-update cleanup'
    'gamemode: to postpone background checks when gaming'
    'snap-pac: for automatic Btrfs snapshots on update (if using snapper)'
    'psmisc: for alternative pacman lock detection using fuser'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6f793f32dfbccf9289c4859e36928fe2715b478d6544315ab86857300b736391')

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 "arch-smart-update.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
