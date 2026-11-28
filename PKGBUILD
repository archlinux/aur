# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nyagos-bin
pkgver=4.4.20_2
pkgrel=1
pkgdesc="Hybrid command-line shell"
arch=('x86_64')
url="https://github.com/nyaosorg/nyagos"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/nyaosorg/nyagos/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/nyagos-${pkgver}-linux-amd64.zip")
sha256sums=('dc1d73784773435691df02c39734fdb07eafdeb05aa3778d7f416841314e0453')
sha256sums_x86_64=('ecd3516173a4910e6878c1913334635e39698836bb0b13e32d66fea04f841800')

package() {
  install -Dm755 "nyagos" "${pkgdir}/usr/bin/nyagos"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
