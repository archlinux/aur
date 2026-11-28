# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=xalgorix-bin
pkgver=4.6.212
pkgrel=1
pkgdesc="AI penetration testing agent that exploit-verifies every finding"
arch=('x86_64' 'aarch64')
url="https://github.com/xalgorix/xalgorix"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/xalgorix/xalgorix/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/xalgorix-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/xalgorix-linux-arm64")
sha256sums=('d93b22599cc72433177e2abee8d77d80bca664120af7c6a70a5d4ae2a12bbd44')
sha256sums_x86_64=('1235724ae8d11ef7bc32bdab3b97187f329ffadb602d34cff1ab4f7e70a6801e')
sha256sums_aarch64=('d7ce4071d614aaab22d77a94b76fc581ea57b3b5cba13d4352e6cad1a663c740')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/xalgorix"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
