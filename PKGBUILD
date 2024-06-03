# Maintainer: veikk.com

_pkgname=vktablet
pkgname=veikk-tablet-bin
pkgver=1.2.5_14
_pkgv=$(echo ${pkgver} | sed 's/_/-/')
pkgrel=2
pkgdesc="Veikk tablet driver retrieved from official veikk website"
arch=("x86_64")
url="https://www.veikk.com"
license=("GPLv3")
provides=("veikk-tablet-bin" "veikk-tablet-bin-debug")
source=("https://veikk.com/image/catalog/Software/${_pkgname}-${_pkgv}.${arch}_rpm.zip")
md5sums=("792c357029102b64fa89d51d40636da6")
prepare() {
  bsdtar -xf ${_pkgname}-${_pkgv}.${arch}.rpm
}

package() {
  cp -r "${srcdir}/etc" "${pkgdir}/etc"
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
  cp -r "${srcdir}/lib" "${pkgdir}/usr"
}

