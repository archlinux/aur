# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=hev-socks5-tproxy-bin
pkgver=2.14.0
pkgrel=1
pkgdesc="Lightweight, fast and reliable SOCKS5 transparent proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/heiher/hev-socks5-tproxy"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/heiher/hev-socks5-tproxy/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/hev-socks5-tproxy-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/hev-socks5-tproxy-linux-arm64")
sha256sums=('1ba4fd82422348f6d7a652363fa214ffbdfa9c9aff70f1b44cda1fdb125661ac')
sha256sums_x86_64=('4775e5c381765b81a26328e65a0de883114803336379153b73f80cc76049ead9')
sha256sums_aarch64=('249a4368e0d3c27df260d0ac19173e0ea0f41a9debfe506f6389e9546f8e38e2')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/hev-socks5-tproxy"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
