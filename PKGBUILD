# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gogstash-bin
pkgver=0.1.21
pkgrel=1
pkgdesc="Logstash-like log pipeline"
arch=('x86_64')
url="https://github.com/tsaikd/gogstash"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/tsaikd/gogstash/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/gogstash-Linux-x86_64")
sha256sums=('92ecb0f74dbbd829ca42b7a3802ae8a4cf7ffc80620ede59436ae7a2f1f1725e')
sha256sums_x86_64=('e1096455e3157de5bf6228e646bb2b89a073991ffb79fe2f76ed3fe8c88c3ac5')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/gogstash"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
