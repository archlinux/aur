# $Id$
# Maintainer: Ido Rosen <ido@kernel.org>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
# 

pkgname='sfutils'
pkgdesc="Solarflare Utilities for Linux (sfupdate, sfboot, sfctool, etc.)"
pkgver='4.1.2.1009'
pkgrel=1
arch=('x86_64')
url='http://www.solarflare.com/'
license=('custom')
#depends=('openonload')
makedepends=('rpmextract')
options=('!libtool' '!strip' '!makeflags' '!buildflags' 'staticlibs')
source=("https://support.solarflare.com/index.php?option=com_cognidox&file=SF-107601-LS-24_Solarflare_Linux_Utilities_RPM_64bit.zip&task=download&format=raw&id=1945&Itemid=11")
sha512sums=('4f3df0f797a344dc5e5dceb4e762de4cae6a646f72aca54014be1dabeff9c6f6286dd626a10083ef1c85f0cf94b1baf0da187992ba3c40138c4c4094b065b348')
#install=

prepare() {
  rpmextract.sh ${srcdir}/${pkgname}-${pkgver}-${pkgrel}.x86_64.rpm
}

package() {
  cd "${srcdir}"

  mv "${srcdir}/usr" "${pkgdir}/."
}
