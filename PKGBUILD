# Maintainer: M0Rf30

pkgname=kodi-addon-superrepo-adult
pkgver=0.7.04
pkgrel=2
pkgdesc='The world largest Kodi addon repository containing more than 1.300 addons'
codename=jarvis
classname=superrepo.kodi.${codename}.adult
arch=('any')
url='http://superrepo.org/'
license=('GPL3')
depends=('kodi')
source=("http://srp.nu/${codename}/genres/adult/${classname}-${pkgver}.zip")

package() {
  mkdir -p "${pkgdir}/usr/share/kodi/addons/"
  cp -r "${srcdir}/${classname}/" "${pkgdir}/usr/share/kodi/addons/"
  find "${pkgdir}/usr/share/kodi/addons/${classname}/" -type d -name '.git' -exec rm -rf {} \;
  find "${pkgdir}/usr/share/kodi/addons/${classname}/" -type f -exec chmod 644 {} \;
}

md5sums=('3fd29d3c4714f858dd45f89088de2b91')
