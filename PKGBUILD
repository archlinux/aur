# Maintainer: M0Rf30

pkgname=kodi-addon-superrepo-adult
pkgver=0.5.205
pkgrel=1
pkgdesc='The world largest Kodi addon repository containing more than 1.300 addons'
codename=helix
classname=repository.superrepo.org.${codename}.others.adult
arch=('any')
url='http://superrepo.org/'
license=('GPL3')
depends=('kodi')
source=("http://mirrors.superrepo.org/addons/${codename}/${classname}/${classname}-${pkgver}.zip")

package() {
  mkdir -p "${pkgdir}/usr/share/kodi/addons/"
  cp -r "${srcdir}/${classname}/" "${pkgdir}/usr/share/kodi/addons/"
  find "${pkgdir}/usr/share/kodi/addons/${classname}/" -type d -name '.git' -exec rm -rf {} \;
  find "${pkgdir}/usr/share/kodi/addons/${classname}/" -type f -exec chmod 644 {} \;
}

md5sums=('2ff22cb7257d8e95a645a97abd22bb80')
