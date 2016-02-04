# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=yosembiance-git
pkgver=b98781a
_pkgname=Yosembiance
_pkgname1=${_pkgname}-Atomic-Blue
_pkgname2=${_pkgname}-Atomic-Orange
_pkgname3=${_pkgname}-Kraken-Blue
_pkgname4=${_pkgname}-Ubuntu-Blue
_pkgname5=${_pkgname}-Ubuntu-Orange
pkgrel=1
pkgdesc="Yosembiance theme"
arch=('any')
license=('GPL3')
source=("$_pkgname::git+https://github.com/bsundman/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --always | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  mkdir -p ${pkgdir}/usr/share/themes/
  L=('1 2 3 4 5')
  cp -a ${srcdir}/${_pkgname}/${_pkgname1} ${pkgdir}/usr/share/themes/
  cp -a ${srcdir}/${_pkgname}/${_pkgname2} ${pkgdir}/usr/share/themes/
  cp -a ${srcdir}/${_pkgname}/${_pkgname3} ${pkgdir}/usr/share/themes/
  cp -a ${srcdir}/${_pkgname}/${_pkgname4} ${pkgdir}/usr/share/themes/
  cp -a ${srcdir}/${_pkgname}/${_pkgname5} ${pkgdir}/usr/share/themes/
  chmod 755 -R ${pkgdir}/usr/share/themes
}
