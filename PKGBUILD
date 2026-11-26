# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ldeep-bin
pkgver=2.0.4
pkgrel=1
pkgdesc="In-depth LDAP enumeration utility"
arch=('x86_64')
url="https://github.com/franc-pentest/ldeep"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/franc-pentest/ldeep/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/ldeep_linux-amd64")
sha256sums=('785dd0f2cc587b99e8340ad744653f8143e0596cff506c2ac389ef5dc0758475')
sha256sums_x86_64=('0b9876ea674609a1667c39475c2ccfddfaa36e794879aee63b77ab81ff263b29')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/ldeep"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
