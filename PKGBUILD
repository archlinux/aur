# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=herdr-navigator-bin
pkgver=0.3.6
pkgrel=1
pkgdesc="Fuzzy navigator for herdr workspaces, agents and sessions"
arch=('x86_64')
url="https://github.com/thanhdat77/herdr-navigator"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/herdr-navigator-linux-x86_64.tar.gz")
sha256sums_x86_64=('ae3c37621cd8b5f777806780b1b1f9312c5f7cfa3c6e343df23b268c46409430')

package() {
  install -Dm755 "herdr-navigator/herdr-navigator" "${pkgdir}/usr/bin/herdr-navigator"
  install -Dm644 "herdr-navigator/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "herdr-navigator/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
