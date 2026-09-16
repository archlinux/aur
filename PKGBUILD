# Maintainer: czyt <czytcn@gmail.com>
pkgname=herdr-bin
pkgver=0.9.1
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
sha256sums=('2f105759457e42e86cb989697f6b89e4d1ed3491a238664b33ef8a343048901b'
            'c0c84a2014ef7c016240ea0be2f07129c1770f9e1c0162d5ebaa303235ae0905'
            '58d842ef99bac0b3e2ab4aea1a6ae3856ce656959e9f0db90f33342ea2b2c821')
sha256sums_x86_64=('2a02fed16beb651ef006e1d43f048f652ca4dc58ad053cd2d44450563d5c54b7')
sha256sums_aarch64=('f4ccf4de745f2cb9a39a983e9ba3703dad50ec2a58dea83026ceab721bbd8d9e')

package() {
    install -Dm755 "herdr-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/herdr"
    install -Dm644 herdr.bash "${pkgdir}/usr/share/bash-completion/completions/herdr"
    install -Dm644 _herdr "${pkgdir}/usr/share/zsh/site-functions/_herdr"
    install -Dm644 herdr.fish "${pkgdir}/usr/share/fish/vendor_completions.d/herdr.fish"
}
