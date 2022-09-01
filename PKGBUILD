# Maintainer: Danilo Luvizotto <danilo dot luvizotto at gmail dot com>
# based on BOSL PKGBUILD by helsotainer <helsotainer at gmail dot com>
pkgname=openscad-bosl2-git
_name=BOSL2
pkgver=r3176.b4872e2
pkgrel=1
pkgdesc="BOSL2 library for OpenSCAD"
arch=('any')
url='github.com/revarbat/BOSL2'
license=('BSD 2-Clause')
source=(git+https://github.com/revarbat/BOSL2.git)

md5sums=('SKIP')

pkgver() {
    cd "${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_name}"

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mkdir -p "${pkgdir}/usr/share/openscad/libraries/"
  cp -r "${srcdir}"/* "${pkgdir}/usr/share/openscad/libraries/"
}

# vim:set ts=2 sw=2 et:
