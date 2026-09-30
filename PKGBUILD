# Maintainer: czyt <czytcn@gmail.com>
pkgname=herdr-bin
pkgver=0.9.3
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
sha256sums=('0a97d9af0f0fb46ebe5d19fb82a5a512f544c3db563d7c5a14634b4c6378921b'
            '4ea23f7195f512904084be9b5078fea4a6bbc8ea6460e2e1590e320e8354d8f7'
            '16baaafc78421eb6ac74072ed697405924910478a8070f30a8c712859bd63e22')
sha256sums_x86_64=('18a8dc65f1c2fa485884344356dea1cfd911c6f06cf46fa78e193f4087f4dba7')
sha256sums_aarch64=('4de7aa3e25678812e92960de64f7c2aaa1bca1f0f80a3c5e559837e231e1f5c0')

package() {
    install -Dm755 "herdr-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/herdr"
    install -Dm644 herdr.bash "${pkgdir}/usr/share/bash-completion/completions/herdr"
    install -Dm644 _herdr "${pkgdir}/usr/share/zsh/site-functions/_herdr"
    install -Dm644 herdr.fish "${pkgdir}/usr/share/fish/vendor_completions.d/herdr.fish"
}
