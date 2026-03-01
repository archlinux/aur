# Maintainer: motorrin
pkgname=eos-smart-update
pkgver=1.0.1
pkgrel=1
pkgdesc="Smart Update Wrapper for EndeavourOS & Arch Linux with safety checks and backups"
arch=('any')
url="https://github.com/motorrin/EndeavourOS_Smart_Update_Wrapper"
license=('MIT')
depends=('bash' 'python' 'pacman' 'tar' 'gawk' 'coreutils' 'psmisc')
optdepends=('reflector: for Arch Linux mirror updates'
            'eos-rankmirrors: for EndeavourOS mirror updates'
            'yay: AUR helper support'
            'paru: AUR helper support'
            'topgrade: for comprehensive system updates')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fa1beae0f22885eb364c70d21e2fe97aaf3dcfa80e599561fd1e8eb9be269c7f')

package() {
    cd "EndeavourOS_Smart_Update_Wrapper-${pkgver}"

    install -Dm755 "EndeavourOS_Smart_Update_Wrapper" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
