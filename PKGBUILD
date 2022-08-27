# Maintainer: veikk.com

_pkgname=vktablet
pkgname=veikk-tablet-bin
pkgver=1.0.3_3
_pkgv=$(echo ${pkgver} | sed 's/_/-/')
pkgrel=1
pkgdesc="Veikk tablet driver retrieved from official veikk website"
arch=("x86_64")
url="https://www.veikk.com"
license=("GPLv3")
provides=("veikk-tablet-bin")
source=("${_pkgname}-${pkgver}.zip::https://veikk.com/image/catalog/Software/new/Linux%EF%BC%88mageia%E3%80%81red-hat%E3%80%81Fedora%EF%BC%89.zip")
md5sums=("SKIP")

prepare() {
  mv Linux*/*.rpm $(pwd) 
  bsdtar -xvf "${_pkgname}-${_pkgv}.${arch}.rpm"
}

package() {
  cp -r "${srcdir}/etc" "${pkgdir}/etc"
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
  cp -r "${srcdir}/lib" "${pkgdir}/usr"
}

