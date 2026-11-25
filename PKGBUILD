# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=xalgorix-bin
pkgver=4.6.209
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
sha256sums_x86_64=('75a239101891f11cc40eac91b53b9ed6f3ff8ef37bf8a188e8bcde349a68057a')
sha256sums_aarch64=('3647c8e776e5512ce01d345f450789a3588afac6b889bc6337735c713b21e949')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/xalgorix"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
