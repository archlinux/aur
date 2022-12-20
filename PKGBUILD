# Maintainer:  <clu>

pkgname=ds9-bin  
_pkgname=ds9
pkgver=8.4
pkgrel=1
pkgdesc="SAOImage DS9: Astronomical Data Visualization Application"
url="http://hea-www.harvard.edu/RD/ds9/"
arch=('x86_64')
license=('GPL2')
options=(!strip)
provides=(${_pkgname})
depends=()
makedepends=()
conflicts=(ds9)
replaces=()
backup=()
#https://ds9.si.edu/download/ubuntu20/ds9.ubuntu20.8.3.tar.gz 
source=(http://ds9.si.edu/download/ubuntu20/${_pkgname}.ubuntu20.${pkgver}.tar.gz
        ds9.desktop
        ds9.png)
md5sums=('8ecd7f5022397ab10b0bb2d68e9121fc'
         'f1738e4ec665ae9afd1b65b86e6a07f1'
         '9297d5738f5f462831075c483dc785d5')

# ds9.desktop
#md5sums+=('195b619383718be1dffe94e39975f006')

package() {
  cd ${srcdir}

  install -Dm755 ds9 ${pkgdir}/usr/bin/${_pkgname}
  install -Dm644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  install -Dm644 ${_pkgname}.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
}

