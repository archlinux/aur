# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bbcli-tui-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="A terminal-based BBC News reader featuring a compact, numbered list interface"
arch=('x86_64' 'aarch64')
url="https://github.com/hako/bbcli"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/hako/bbcli/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/bbcli-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/bbcli-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('11223d8059b387fc66f8e2807bca33c4eccc90cf1e6a01a11e0905110e6f0e71')
sha256sums_x86_64=('2e8df37dfedcea9e04ece8b6128e5905d0ceac094e1d2ef8e00b2d2609ea96e5')
sha256sums_aarch64=('b5c22ef7e6b8da0e79463b8a8ba846f61a6e48162f24a93317bf11ed92b0d0bc')

package() {
  install -Dm755 "bbcli" "${pkgdir}/usr/bin/bbcli"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
