# Maintainer: M0Rf30

pkgname=kodi-addon-superrepo-adult
pkgver=0.7.04
pkgrel=3
pkgdesc='The world largest Kodi addon repository containing more than 1.300 addons'
_codename=jarvis
_classname=superrepo.kodi.${_codename}.adult
arch=('any')
url='http://superrepo.org/'
license=('GPL3')
depends=('kodi')
makedepends=('unzip')
source=("http://srp.nu/${_codename}/genres/adult/${_classname}-${pkgver}.zip")
noextract=("${source[@]##*/}")

prepare() {
  unzip -o ${_classname}-${pkgver}.zip
}
package() {
  mkdir -p "${pkgdir}/usr/share/kodi/addons/"
  cp -r "${srcdir}/${_classname}/" "${pkgdir}/usr/share/kodi/addons/"
  find "${pkgdir}/usr/share/kodi/addons/${_classname}/" -type d -name '.git' -exec rm -rf {} \;
  find "${pkgdir}/usr/share/kodi/addons/${_classname}/" -type f -exec chmod 644 {} \;
}

md5sums=('3fd29d3c4714f858dd45f89088de2b91')
