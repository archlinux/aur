# Maintainer:  <clu>

pkgname=ds9-bin  
_pkgname=ds9
pkgver=7.5
pkgrel=1
pkgdesc="SAOImage DS9: Astronomical Data Visualization Application"
url="http://hea-www.harvard.edu/RD/ds9/"
arch=('x86_64')
# arch=('i686' 'x86_64')
# [ "${CARCH}" = 'i686' ] && _arch=''
# [ "${CARCH}" = 'x86_64' ] && _arch='64'
license=('GPL2')
options=(!strip)
provides=(${_pkgname})
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=(http://ds9.si.edu/download/centos6/${_pkgname}.centos6.${pkgver}.tar.gz
        ds9.desktop
        ds9.png)
md5sums=('66fa22d30803ecf69e06465d2e5cd234'
         '11578c2ec2ad76e3fe47be0804e0083e'
         '9297d5738f5f462831075c483dc785d5')

# Older PKGBUILD stuff when 32 and 64 bit were supported
# source=(http://hea-www.harvard.edu/RD/${_pkgname}/download/linux${_arch}/$_pkgname.linux${_arch}.${pkgver}.tar.gz
#         ds9.desktop
#         ds9.png)

# [ "${CARCH}" = 'i686' ] && md5sums=('10f564218cfa169d2927d175754e57fe')
# [ "${CARCH}" = 'x86_64' ] && md5sums=('9f815d0f17260773a2c4663fe9cf0cd4')

# # ds9.desktop, ds9.png
# md5sums+=('11578c2ec2ad76e3fe47be0804e0083e'
#           '9297d5738f5f462831075c483dc785d5')

package() {
  cd ${srcdir}

  install -Dm755 ds9 ${pkgdir}/usr/bin/${_pkgname}
  install -Dm644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  install -Dm644 ${_pkgname}.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
}

