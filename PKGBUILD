# $Id$
# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Ido Rosen <ido@kernel.org>

pkgname='sfutils'
pkgdesc="Solarflare Utilities for Linux (sfupdate, sfboot, sfctool, etc.)"
pkgver='8.1.2.1019'
pkgrel=1
arch=('x86_64')
url='https://support.solarflare.com/index.php'
license=('custom')
#depends=('openonload')
makedepends=('rpmextract')
options=('!libtool' '!strip' '!makeflags' '!buildflags' 'staticlibs')
source=(SF-107601-LS-69_Solarflare_Linux_Utilities_RPM_64bit.zip::"https://support.solarflare.com/index.php/component/cognidox/?file=SF-107601-LS-69_Solarflare_Linux_Utilities_RPM_64bit.zip&task=download&format=raw&id=1945")
sha512sums=('b02ad62d76627a87d4cf510e99916a0a7d3163602d9a127afbd91e5e0957d64f0278756d90511cc8fbcff9e8f9a402dec79fa61b863f470b0b9172fc74ada854')

prepare() {
  rpmextract.sh ${srcdir}/${pkgname}-${pkgver}-${pkgrel}.x86_64.rpm
}

package() {
  cd "${srcdir}"

  mv "${srcdir}/usr" "${pkgdir}/."
}
