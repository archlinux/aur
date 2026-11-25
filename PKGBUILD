# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nmap-formatter-bin
pkgver=3.1.5
pkgrel=1
pkgdesc="Convert Nmap results to HTML, CSV, JSON, Markdown, Graphviz, SQLite and Excel"
arch=('x86_64' 'aarch64')
url="https://github.com/vdjagilev/nmap-formatter"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/vdjagilev/nmap-formatter/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/nmap-formatter-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/nmap-formatter-linux-arm64.tar.gz")
sha256sums=('f8a018f34b0d5173568c8a2d4225c4842b5f382cb2a86852d6f85f798b24b187')
sha256sums_x86_64=('e4b54f41ad6ced457910cfaba6a6e19948904bee56ecde2512a266f63153c638')
sha256sums_aarch64=('ebd1ab908c926e12767d69714f6ef0686e2285adaff8f236b8d376f8d58f69b8')

package() {
  install -Dm755 "nmap-formatter" "${pkgdir}/usr/bin/nmap-formatter"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
