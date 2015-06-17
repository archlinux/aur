# Maintainer: M0Rf30

pkgname=kodi-addon-superrepo-all
pkgver=0.5.205
pkgrel=1
pkgdesc='The world largest XBMC addon repository containing more than 1.300 addons'
codename=helix
classname=repository.superrepo.org.${codename}.all
arch=('any')
url='http://superrepo.org/'
license=('GPL3')
depends=('kodi')
source=("http://mirrors.superrepo.org/addons/${codename}/${classname}/${classname}-${pkgver}.zip")
optdepends=('kodi-addon-superrepo-adult: enable adult addons for XBMC')

package() {
  mkdir -p "${pkgdir}/usr/share/kodi/addons/"
  cp -r "${srcdir}/${classname}/" "${pkgdir}/usr/share/kodi/addons/"
  find "${pkgdir}/usr/share/kodi/addons/${classname}/" -type d -name '.git' -exec rm -rf {} \;
  find "${pkgdir}/usr/share/kodi/addons/${classname}/" -type f -exec chmod 644 {} \;
}

md5sums=('2de695735f88c5ad9d6949030697ff17')
