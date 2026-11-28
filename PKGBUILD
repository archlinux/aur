# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tcpproxy-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Cross-platform TCP proxy"
arch=('x86_64')
url="https://github.com/mqudsi/tcpproxy"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/mqudsi/tcpproxy/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tcpproxy-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('0314e6d3981b21959b188b5cbbc77c6404c6dfc281451fe3dd7cc2dfa216350c')
sha256sums_x86_64=('28346be070a7f622cb0e17533b4944d92c7dfe8189f03117c7bbbe943482bec3')

package() {
  install -Dm755 "tcpproxy" "${pkgdir}/usr/bin/tcpproxy"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
