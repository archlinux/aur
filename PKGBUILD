# Maintainer: Michele Mocciola <mickele>

pkgname=salome-eficas
pkgver=2015.2
pkgrel=1
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - EFICAS Module"
url="http://www.code-aster.org/V2/spip.php?article295"
depends=('salome-gui>=7.6.0' 'salome-gui<7.7.0' 'eficas>=2015.2')
makedepends=()
arch=('i686' 'x86_64')
license=('LGPL')

_pkgsubver=2
source=("http://www.code-aster.org/FICHIERS/SALOME-MECA-${pkgver}-LGPL-${_pkgsubver}.tgz" "${pkgname}.profile")

_installdir=/opt/salome/eficas

prepare() {
  cd "$srcdir"

  tail --lines=+834 SALOME-MECA-${pkgver}-LGPL.run > extracted.tar.gz
  tar xzf extracted.tar.gz
}

build() {
  cd "${srcdir}"
  
}

package() {
  cd "${srcdir}/V2015_2/modules/EFICAS_V7_6_0"
  install -d -m755 "${pkgdir}${_installdir}"
  cp -rp * "${pkgdir}${_installdir}/"
  
  install -D -m755 "${srcdir}/${pkgname}.profile" \
                   "${pkgdir}/etc/salome/profile.d/${pkgname}.sh"

}
md5sums=('a78eae0b1937f06ced8e7f570b05f94b'
         'd45d5c60252a726244d7e596b828daff')
