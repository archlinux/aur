#
# PKGBUILD for ddhx-git
#
# Maintainer: Uffe Jakobsen: uffe _.at._ uffe _.dot._ org
# Contributer: dax <dev@dax.moe>
#

pkgname=extract-adf-git
_pkgname=extract-adf
pkgver=r11.7762d71
pkgrel=1
pkgdesc="Extract files from (broken) Commodore Amiga OFS ADF/ADZ/DMS disk images"
arch=('x86_64')
url="https://github.com/mist64/extract-adf"
#license=('MIT')
depends=('glibc' 'zlib')
makedepends=('git')
#provides=("ddhx")
#conflicts=("ddhx")
source=('git+https://github.com/mist64/extract-adf')
sha256sums=('SKIP')

pkgver()
{
  #cd "${srcdir}/${_pkgname}-${_pkgver}"
  cd "${srcdir}/${_pkgname}"
  #git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare()
{
  cd "${srcdir}/${pkg_name_ver}"
}

build()
{
  cd "${srcdir}/${_pkgname}"
  make all
}

package()
{
  cd "${srcdir}/${_pkgname}"
  #make install DESTDIR="${pkgdir}" PREFIX="/usr"
  install -D extract-adf "${pkgdir}/usr/bin/extract-adf"
  #install -D -m 0644 ddhx.1 "${pkgdir}/usr/share/man/man1/ddhx.1"
  #install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  #install -D -m 0644 README "${pkgdir}/usr/share/doc/${_pkgname}/README"
}

#
# EOF
#
