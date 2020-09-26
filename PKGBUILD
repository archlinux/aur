# $Id$
# Maintainer: wuffleton <woof@null.dog>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Ido Rosen <ido@kernel.org>

pkgname='sfutils'
pkgdesc="Solarflare Utilities for Linux (sfupdate, sfboot, sfctool, etc.)"
pkgver='8.2.1.1003'
pkgrel=1
arch=('x86_64')
url='https://support.solarflare.com/index.php'
license=('custom')
makedepends=('rpmextract')
options=('!libtool' '!strip' '!makeflags' '!buildflags' 'staticlibs')
source=(SF-107601-LS-70_Solarflare_Linux_Utilities_RPM_64bit.zip::"https://support.solarflare.com/wp/drivers?sd=SF-107601-LS-70&pe=1945")
sha512sums=('e1aaf3c8d14d78b567ebe49be3e001db08c0cd917f78e570f7dbf4fe12b50d3d2dbb7e23c0e6d582bacb0de8c37a3c21b75ecdd4c044236e6d2470941dcc549f')

prepare() {
  rpmextract.sh ${srcdir}/${pkgname}-${pkgver}-${pkgrel}.x86_64.rpm
}

package() {
  cd "${srcdir}"
  mv "${srcdir}/usr" "${pkgdir}/."
  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}
