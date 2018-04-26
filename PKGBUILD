# Maintainer:  <clu>

pkgname=ds9-bin  
_pkgname=ds9
pkgver=7.6
pkgrel=1
pkgdesc="SAOImage DS9: Astronomical Data Visualization Application"
url="http://hea-www.harvard.edu/RD/ds9/"
arch=('x86_64')
license=('GPL2')
options=(!strip)
provides=(${_pkgname})
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=(http://ds9.si.edu/download/ubuntu17/${_pkgname}.ubuntu17.${pkgver}.tar.gz
        ds9.desktop
        ds9.png)
md5sums=('e6fa17d3007bf3e21d77794d1401229c'
         'f1738e4ec665ae9afd1b65b86e6a07f1'
         '9297d5738f5f462831075c483dc785d5')

# Used to use centos build -- but libssl is not up to date on that build now.
# source=(http://ds9.si.edu/download/centos7/${_pkgname}.centos7.${pkgver}.tar.gz
#         ds9.desktop
#         ds9.png)

package() {
  cd ${srcdir}

  install -Dm755 ds9 ${pkgdir}/usr/bin/${_pkgname}
  install -Dm644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  install -Dm644 ${_pkgname}.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
}

