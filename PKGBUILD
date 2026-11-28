# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=jargo-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Real-time voice AI agents over WebRTC, phone and LiveKit"
arch=('x86_64')
url="https://github.com/gojargo/jargo"
license=('BSD-2-Clause')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/jargo_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('de3a15faf3724bf3132cd41cf4bd80296d4b647cfba5486a218b3aa02b541712')

package() {
  install -Dm755 "jargo-echo" "${pkgdir}/usr/bin/jargo-echo"
  install -Dm755 "jargo-voicebot" "${pkgdir}/usr/bin/jargo-voicebot"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
