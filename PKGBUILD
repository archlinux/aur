# Maintainer: veikk.com

_pkgname=vktablet
pkgname=veikk-tablet-bin
pkgver=1.2.4_10
_pkgv=$(echo ${pkgver} | sed 's/_/-/')
pkgrel=1
pkgdesc="Veikk tablet driver retrieved from official veikk website"
arch=("x86_64")
url="https://www.veikk.com"
license=("GPLv3")
provides=("veikk-tablet-bin")
source=("https://veikk.com/image/catalog/Software/new/${_pkgname}-${_pkgv}.${arch}rpm.zip")
md5sums=("7c8a6eeca8a646b21c9c643b5b4f7ee3")

prepare() {
  bsdtar -xf ${_pkgname}-${_pkgv}.${arch}.rpm
}

package() {
  cp -r "${srcdir}/etc" "${pkgdir}/etc"
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
  cp -r "${srcdir}/lib" "${pkgdir}/usr"
}

