# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dnspyre-bin
pkgver=3.12.0
pkgrel=1
pkgdesc="High-QPS DNS benchmark tool"
arch=('x86_64' 'aarch64')
url="https://github.com/Tantalor93/dnspyre"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dnspyre_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/dnspyre_linux_arm64.tar.gz")
sha256sums_x86_64=('139df306dfaa7a6d30dbe0dbcf225ce32d360801155cff66943509972696d4e7')
sha256sums_aarch64=('39a6d55e93c57c169dca405299207260177d603d87ad11ca85019dc38a4c0a38')

package() {
  install -Dm755 "dnspyre" "${pkgdir}/usr/bin/dnspyre"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "completions/dnspyre.bash" "${pkgdir}/usr/share/bash-completion/completions/dnspyre"
  install -Dm644 "completions/dnspyre.zsh" "${pkgdir}/usr/share/zsh/site-functions/_dnspyre"
  install -Dm644 "manpages/dnspyre.1.gz" -t "${pkgdir}/usr/share/man/man1"
}
