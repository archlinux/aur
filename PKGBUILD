# Maintainer: czyt <czytcn@gmail.com>
pkgname=herdr-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Supervise multiple coding agents in one terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/herdrdev/herdr"
license=('AGPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
options=('!debug')
provides=("herdr=${pkgver}")
conflicts=('herdr')
source_x86_64=("herdr-${pkgver}-x86_64::https://github.com/herdrdev/herdr/releases/download/v${pkgver}/herdr-linux-x86_64")
source_aarch64=("herdr-${pkgver}-aarch64::https://github.com/herdrdev/herdr/releases/download/v${pkgver}/herdr-linux-aarch64")
source=('herdr.bash' '_herdr' 'herdr.fish')
sha256sums=('cc0ac46f79f46012e72050bef7660e70d7e171f0ecfa9951445632ab83d4f308'
            'e2b5370f72d46f27d8e132daa509411e96c084d01cda677997bd232eedf3896c'
            '446602af3d53c43bc5d4c961e57c2988b3a22770d3091a2b6e13f6078f2b4b0b')
sha256sums_x86_64=('4fa1a01158dd8043da92d31b270780b0dcc10603038d9b61cac4d81ab63fb71f')
sha256sums_aarch64=('9c8db20fb7e7427b138d5367113f1621ffd319f2f65d6f009e2594029115f0d2')

package() {
    install -Dm755 "herdr-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/herdr"
    install -Dm644 herdr.bash "${pkgdir}/usr/share/bash-completion/completions/herdr"
    install -Dm644 _herdr "${pkgdir}/usr/share/zsh/site-functions/_herdr"
    install -Dm644 herdr.fish "${pkgdir}/usr/share/fish/vendor_completions.d/herdr.fish"
}
