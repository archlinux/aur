# Maintainer: Evan Penner <gryffyn@archlinux 'dot' net>
# Contributor: Iru Cai <mytbk920423\x40gmail 'dot' com>
# Contributor: Houlala <houlala 'at' gmail 'dot' com>
# Contributor: Olivier Duclos <olivier.duclos gmail.com>
# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: VuDu <vudu 'dot' curse 'at' gmail 'dot' com>

pkgname=xnviewmp
pkgver=0.75
pkgrel=1
pkgdesc="An efficient multimedia viewer, browser and converter."
url="http://www.xnview.com/en/xnviewmp/"

arch=('x86_64' 'i686')
license=('custom')
depends=('glib2' 'expat' 'libpng12' 'gstreamer0.10-base' 'desktop-file-utils' 'libxslt' 'qt5-multimedia' 'qt5-webkit' 'qt5-svg' 'qt5-x11extras')
optdepends=('gvfs: support for moving files to trash')

install='xnviewmp.install'

source=("xnview.tgz::http://www.xnview.com/beta/xnview.tgz"
        "xnviewmp.desktop")
md5sums=('b131f97bb0c9eb7e6968cf1576ed9079'
         '24f44d5a881b94daf48775213a57e4ec')

if [ "$CARCH" = 'x86_64' ]; then
  source=("xnview-x64.tgz::http://download.xnview.com/xnview-x64.tgz"
          "xnviewmp.desktop")
  md5sums=('767f931a61fe6062d56733a520c424e3'
           '24f44d5a881b94daf48775213a57e4ec')
fi


package() {
  install -d -m755 "${pkgdir}/usr/bin"
  install -d -m755 "${pkgdir}/usr/share/applications"

  install -m644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

}

# vim:set ts=2 sw=2 et:
