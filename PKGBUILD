# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=leproxy-bin
pkgver=20191014
pkgrel=1
pkgdesc="HTTPS reverse proxy with automatic Let's Encrypt for multiple hosts"
arch=('x86_64')
url="https://github.com/artyom/leproxy"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/artyom/leproxy/${pkgver}/LICENSE.txt")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/leproxy-linux-amd64.tar.gz")
sha256sums=('af0871713ddff2f50e6a231df44854e2166fc0e622aa09d0d7bd5acf94f752f9')
sha256sums_x86_64=('21f04ed32f51b90854d899b653b52ee05cd1319310a9e8bc52c48e6e28859ef7')

package() {
  install -Dm755 "leproxy" "${pkgdir}/usr/bin/leproxy"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
