# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mark-bin
pkgver=17.3.1
pkgrel=1
pkgdesc="Sync your markdown files with Confluence pages"
arch=('x86_64' 'aarch64')
url="https://github.com/kovetskiy/mark"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mark_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mark_Linux_arm64.tar.gz")
sha256sums_x86_64=('9f6b4072eb450dffe47ad57c2e628d4b7c70e670c2ca6e93f86d5c9bccb182df')
sha256sums_aarch64=('ce55d6d058d99dc1d2158604e76d777c49a6d515e09e3c4227987289add73710')

package() {
  install -Dm755 "mark" "${pkgdir}/usr/bin/mark"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
