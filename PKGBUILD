# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>


_pkgname="mitsuba-blender"
pkgname="${_pkgname}-hg"
pkgver=105.70361d3b0956
pkgrel=2
pkgdesc="Mitsuba integration plugin for blender, based on luxrender luxblend code"
arch=('any')
url="https://www.mitsuba-renderer.org/repos/exporters/mitsuba-blender"
license=('GPL3')
depends=('blender' 'mitsuba')
makedepends=('mercurial')
provides=('mtsblend')
conflicts=('mtsblend')
options=()
source=("hg+https://www.mitsuba-renderer.org/repos/exporters/mitsuba-blender")
md5sums=('SKIP') 

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(hg identify -n).$(hg identify -i)
}

package() {
  _blender=$(blender -v | head -n1 | cut -f2 -d ' ')
  cd "${srcdir}/${_pkgname}"
  install -d -m755 "${pkgdir}/usr/share/blender/${_blender}/scripts/addons"
  cp -a mtsblend "${pkgdir}/usr/share/blender/${_blender}/scripts/addons"
}

# vim:set ts=2 sw=2 et:
