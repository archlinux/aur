# Maintainer: czyt <czytcn@gmail.com>
pkgname=herdr-bin
pkgver=0.8.2
pkgrel=2
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
sha256sums=('84ac4e629fc2c714ab5e8267b1d3343b5e7375c87348d1e87d80a31a7fc64e1b'
            'b8733a39ae9fa3f0a18986b5deaee84fa37d0dca67f211654590aecc3761d2c0'
            '48b883f8d0148ea39ea35e3fbd0681ab56edb7290806e4860726f4a5fdd38fed')
sha256sums_x86_64=('976150a14d490c94b243ea2e1a7eb2dfb67f12e36b182db90936f6728e6aecf4')
sha256sums_aarch64=('f55610658e1c2e0d2aaef730b4b2ab885f7f8ba00285ab372bfb14f2e3d5b40d')

package() {
    install -Dm755 "herdr-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/herdr"
    install -Dm644 herdr.bash "${pkgdir}/usr/share/bash-completion/completions/herdr"
    install -Dm644 _herdr "${pkgdir}/usr/share/zsh/site-functions/_herdr"
    install -Dm644 herdr.fish "${pkgdir}/usr/share/fish/vendor_completions.d/herdr.fish"
}
