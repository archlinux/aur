# Maintainer: veikk.com

_pkgname=vktablet
pkgname=veikk-tablet-bin
pkgver=3.5.8_3
_pkgv=$(echo ${pkgver} | sed 's/_/-/')
pkgrel=1
pkgdesc="Veikk tablet driver retrieved from official veikk website"
arch=("x86_64")
url="https://www.veikk.com"
license=("GPLv3")
provides=("veikk-tablet-bin" "veikk-tablet-bin-debug")
source=("https://veikk.com/image/catalog/Software/${_pkgname}-${_pkgv}.${arch}.zip")
md5sums=("682e42a8df5d60feca7dd00623627b0b")
prepare() {
  bsdtar -xf ${_pkgname}-${_pkgv}.${arch}.rpm
}

package() {
  cp -r "${srcdir}/etc" "${pkgdir}/etc"
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
  cp -r "${srcdir}/lib" "${pkgdir}/usr"
}

