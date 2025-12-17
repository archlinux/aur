# Maintainer: Richard Lees <git zero at bitservices dot io>
################################################################################

pkgname=wine-ntsync-only
pkgver=0.0.1
pkgrel=1
pkgdesc="This is a small package that enables the Wine NTSYNC kernel driver without actually installing Wine. Useful for Steam/Proton (when NTSYNC is supported) and custom variants of Wine that are manually installed."
arch=('any')
license=('none')
conflicts=('wine')
source=("ntsync.conf")
sha256sums=('c19771ae86e7df179f6b2f4a2837d3f0cbbbba7b32baef41a3c27120c760d78f')

################################################################################

package() {
  install -d "${pkgdir}/usr/lib"
  install -d "${pkgdir}/usr/lib/modules-load.d"

  install -m644 "${srcdir}/ntsync.conf" "${pkgdir}/usr/lib/modules-load.d/ntsync.conf"
}

################################################################################
