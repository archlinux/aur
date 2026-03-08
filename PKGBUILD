# Maintainer: motorrin
pkgname=arch-smart-update
pkgver=2.6.0
pkgrel=1
pkgdesc="Not sure when to update Arch Linux or its derivative? This script will help you decide!"
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
sha256sums=('3868415a63df91ba616d789bdb5ec514c1e4b4d1a87bfdf5fc8b03577ea86db2')

package() {
    cd "Arch_Smart_Update-${pkgver}"

    install -Dm755 "arch-smart-update" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
