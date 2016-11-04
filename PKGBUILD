# Maintainer: M0Rf30

pkgname=kodi-addon-superrepo-adult
pkgver=0.7.04
pkgrel=1
pkgdesc='The world largest Kodi addon repository containing more than 1.300 addons'
codename=jarvis
classname=superrepo.kodi.${codename}.repositories
arch=('any')
url='http://superrepo.org/'
license=('GPL3')
depends=('kodi')
source=("http://srp.nu/${codename}/repositories/superrepo/${classname}-${pkgver}.zip")

package() {
  mkdir -p "${pkgdir}/usr/share/kodi/addons/"
  cp -r "${srcdir}/${classname}/" "${pkgdir}/usr/share/kodi/addons/"
  find "${pkgdir}/usr/share/kodi/addons/${classname}/" -type d -name '.git' -exec rm -rf {} \;
  find "${pkgdir}/usr/share/kodi/addons/${classname}/" -type f -exec chmod 644 {} \;
}

md5sums=('5b0811789cc736fd7371dadaa65a981f')
