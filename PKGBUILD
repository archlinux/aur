# Maintainer: czyt <czytcn@gmail.com>

pkgname=octoscode-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Octoscode - Octos's Coding Agent"
arch=('x86_64' 'aarch64')
url='https://github.com/octos-org/octoscode'
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'ca-certificates')
provides=("octoscode=${pkgver}")
conflicts=('octoscode')
options=('!strip' '!debug')

source_x86_64=("octoscode-${pkgver}-x86_64.tar.xz::${url}/releases/download/v${pkgver}/octoscode-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("octoscode-${pkgver}-aarch64.tar.xz::${url}/releases/download/v${pkgver}/octoscode-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('8f20bce688063769baa523ff3a7b23d748aa8e908530e6e6378607eb34e7bb01')
sha256sums_aarch64=('c411e5649c42ab349f1e1fb3b75c551078b12dcf23d7e97e61ae82515d374f9d')

package() {
  local dist="${srcdir}/octoscode-${CARCH}-unknown-linux-gnu"
  install -Dm755 "${dist}/octoscode" "${pkgdir}/usr/bin/octoscode"
  install -Dm644 "${dist}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
