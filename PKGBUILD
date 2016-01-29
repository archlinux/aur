# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=yosembiance-git
pkgver=6c34883
_pkgname=Yosembiance
_pkgname1=${_pkgname}
_pkgname2=${_pkgname}-Blue
pkgrel=1
pkgdesc="Yosembiance theme"
arch=('any')
license=('GPL3')
source=("$_pkgname::git+https://github.com/bsundman/${_pkgname1}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname1}"
  git describe --always | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  mkdir -p ${pkgdir}/usr/share/themes/
  cp -a ${srcdir}/${_pkgname}/${_pkgname1} ${pkgdir}/usr/share/themes/
  cp -a ${srcdir}/${_pkgname}/${_pkgname2} ${pkgdir}/usr/share/themes/
  chmod 755 -R ${pkgdir}/usr/share/themes
}
