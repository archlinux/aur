# Maintainer: Martin Poljak <martin 'at' poljak 'dot' cz>
# Contributor: Evan Penner <gryffyn@archlinux 'dot' net>
# Contributor: Iru Cai <mytbk920423\x40gmail 'dot' com>
# Contributor: Houlala <houlala 'at' gmail 'dot' com>
# Contributor: Olivier Duclos <olivier.duclos gmail.com>
# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: VuDu <vudu 'dot' curse 'at' gmail 'dot' com>

pkgname=xnviewmp
pkgver=0.79
pkgrel=1
pkgdesc="An efficient multimedia viewer, browser and converter."
url="http://www.xnview.com/en/xnviewmp/"

arch=('x86_64' 'i686')
license=('custom')
depends=('glib2' 'expat' 'libpng12' 'gstreamer0.10-base' 'desktop-file-utils' 'libxslt' 'qt5-multimedia' 'qt5-webkit' 'qt5-svg' 'qt5-x11extras')
optdepends=('gvfs: support for moving files to trash')

source_i686=("http://download.xnview.com/XnViewMP-linux.tgz")
source_x86_64=("http://download.xnview.com/XnViewMP-linux-x64.tgz")
md5sums_x86_64=('9f0849b44217ca792480566225e709c4')
md5sums_i686=('f9ee2c9c66a405c88fea9570a53579eb')

package() {
  install -d -m755 "${pkgdir}/opt/${pkgname}"
  install -d -m755 "${pkgdir}/usr/bin"
  install -d -m755 "${pkgdir}/usr/share/applications"

  cp -a "${srcdir}/XnView"/* "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/xnview.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -m644 "${startdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${srcdir}/XnView/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
