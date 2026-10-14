# Maintainer: czyt <czytcn@gmail.com>
pkgname=herdr-bin
pkgver=0.9.5
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
sha256sums=('7b9b8b3118d891f8247aa6115cd19fe4ae51578d419f1a1910dad49f09d99a5a'
            'dbe949d3b10e5b52896edaf9a86698012906893d7a36349c29d42b0ecdbf189e'
            '51e0c6f3983f9f215bd8642090dfcbe30b7eb8d60b4e4e30d297d5ee49642ed5')
sha256sums_x86_64=('14d9e8bc8b4a9e0118d77c32266f76d461f09b40342eb23752960bd89f59929d')
sha256sums_aarch64=('17d7536f2da50859523680ef279dffcac8e4a235f4e46fe8da6c2ec44141897c')

package() {
    install -Dm755 "herdr-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/herdr"
    install -Dm644 herdr.bash "${pkgdir}/usr/share/bash-completion/completions/herdr"
    install -Dm644 _herdr "${pkgdir}/usr/share/zsh/site-functions/_herdr"
    install -Dm644 herdr.fish "${pkgdir}/usr/share/fish/vendor_completions.d/herdr.fish"
}
