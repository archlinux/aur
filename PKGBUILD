#
# PKGBUILD for ancient
#
# Maintainer: Uffe Jakobsen -=_<_ uffe -=_<_ _at_ _>_=- uffe_dot_org _>_=-
#

pkgname=ancient
pkgver=2.3.0
pkgrel=1
epoch=
pkgdesc="Modern decompressor for old data (archive) compression formats"
arch=('i686' 'x86_64')
_pkgname=${pkgname}
url="https://github.com/temisu/ancient"
license=('BSD-2-Clause')
#groups=()
#makedepends=('')
depends=("glibc" "libgcc" "libstdc++")
checkdepends=()
#optdepends=()
#provides=('')
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=

source=("${pkgname}.tar.gz::https://github.com/temisu/ancient/archive/refs/tags/v${pkgver}.tar.gz")

#noextract=()

sha256sums=("5d1d71f0fb8c69955bb4ec01ed9ffd2b5bf546b10463030dda85d949ea422bc9")

#
#
#

prepare()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./autogen.sh;
  ./configure --prefix="/usr";
}

build()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"

  #make -f Makefile.unix;
  make -f Makefile;
}

check()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"

  #obj/test
}

package()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make PREFIX=/usr DESTDIR="${pkgdir}" install

  #install -m 644 -D "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/"
  install -m 644 -D "LICENSE.bzip2" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.bzip2"

  #install -m 644 -D "COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
  #install -m 644 -D "COPYING.GPL" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING.GPL"

}

# EOF
