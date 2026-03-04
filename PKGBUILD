# Maintainer: motorrin
pkgname=arch-smart-update
pkgver=2.3.0
pkgrel=1
pkgdesc="Universal Smart Update Wrapper for Arch Linux and its derivatives"
arch=('any')
url="https://github.com/motorrin/Arch_Smart_Update"
license=('MIT')
depends=('bash' 'python' 'pacman' 'tar' 'gawk' 'coreutils' 'psmisc' 'curl')
optdepends=('reflector: for Arch Linux mirror updates'
            'cachyos-rate-mirrors: for CachyOS mirror updates'
            'eos-rankmirrors: for EndeavourOS mirror updates'
            'eos-update: for EndeavourOS core updates'
            'yay: AUR helper support'
            'paru: AUR helper support'
            'topgrade: for comprehensive system updates')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6f51564890a1f83bac685156c366dbeaba23805ea12c6dcf4dda925d47d08e11')

package() {
    cd "Arch_Smart_Update-${pkgver}"

    install -Dm755 "arch-smart-update" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
