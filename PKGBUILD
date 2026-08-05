# Maintainer: motorrin
pkgname=arch-smart-update
pkgver=3.23.0
pkgrel=1
pkgdesc="Intelligent update advisor and wrapper for Arch Linux and derivatives"
arch=('any')
url="https://github.com/motorrin/arch-smart-update"
license=('MIT')
depends=('bash' 'python' 'pacman' 'tar' 'gawk' 'coreutils' 'curl' 'zstd' 'grep' 'sed')
optdepends=(
    'reflector: for Arch Linux mirror updates'
    'cachyos-rate-mirrors: for CachyOS mirror updates'
    'eos-rankmirrors: for EndeavourOS mirror updates'
    'eos-update: for EndeavourOS core updates'
    'cachy-update: for CachyOS core updates'
    'arch-update: for general Arch core updates'
    'yay: AUR helper support'
    'paru: AUR helper support'
    'pikaur: AUR helper support'
    'rua: AUR helper support'
    'topgrade: for comprehensive system updates'
    'fakeroot: for running the background update checker without sudo'
    'libnotify: for desktop notifications in daemon mode'
    'psmisc: for lock detection using fuser'
    'util-linux: for terminal log capture using script'
    'gamemode: to postpone background checks when gaming'
    'snap-pac: for automatic Btrfs snapshots on update (if using snapper)'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2199a8912232da670af9696de5ff6a6562e1ab0c5c843f085b1cfbd3ca9fdcfd')

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 "arch-smart-update.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
