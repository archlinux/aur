# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=goplaces-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Google Places command-line client"
arch=('x86_64' 'aarch64')
url="https://github.com/openclaw/goplaces"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/openclaw/goplaces/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/goplaces_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/goplaces_${pkgver}_linux_arm64.tar.gz")
sha256sums=('14293556b79940745123d0160c71d27ed0e9fe9b8a848093f3ed78f4853caafe')
sha256sums_x86_64=('42dd360021c0c273f180fadbbf3690aae036c76b87b34178582d07196863c2a2')
sha256sums_aarch64=('132e51e5cd6241bfd519567e1dcb376dffb3de83288a736894a48fa1987a4d6a')

package() {
  install -Dm755 "./goplaces" "${pkgdir}/usr/bin/goplaces"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
