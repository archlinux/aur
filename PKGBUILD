# helsotainer <helsotainer at gmail dot com>
pkgname=openscad-bosl-git
_name=BOSL
pkgver=r205.7c305fe
pkgrel=2
pkgdesc="BOSL library for OpenSCAD"
arch=('any')
url='github.com/revarbat/BOSL'
license=('BSD 2-Clause')
source=(git://github.com/revarbat/BOSL.git)

md5sums=('SKIP')

pkgver() {
    cd "${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_name}"

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mkdir -p "${pkgdir}/usr/share/openscad/libraries/"
  cp -r "${srcdir}" "${pkgdir}/usr/share/openscad/libraries/"
}

# vim:set ts=2 sw=2 et:
