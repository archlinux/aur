# Maintainer: czyt <czytcn@gmail.com>

pkgname=octoscode-bin
pkgver=0.3.1
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
sha256sums_x86_64=('5c8cb1fd208e991ab7299fd348a53ab2471f621d2418c4d58b964dd19ef3848e')
sha256sums_aarch64=('63a140b1a7e0ba441f34c348e684bfc6ba0c4ed93bf27796f712962fc78c7fc3')

package() {
  local dist="${srcdir}/octoscode-${CARCH}-unknown-linux-gnu"
  install -Dm755 "${dist}/octoscode" "${pkgdir}/usr/bin/octoscode"
  install -Dm644 "${dist}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
