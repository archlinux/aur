# Maintainer: Kevin Brodsky <corax26 'at' gmail 'dot' com>
# Contributor: Evan Penner <gryffyn@archlinux 'dot' net>
# Contributor: Iru Cai <mytbk920423\x40gmail 'dot' com>
# Contributor: Houlala <houlala 'at' gmail 'dot' com>
# Contributor: Olivier Duclos <olivier.duclos gmail.com>
# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: VuDu <vudu 'dot' curse 'at' gmail 'dot' com>
# Contributor: Martin Poljak <martin 'at' poljak 'dot' cz>

pkgname=xnviewmp
pkgver=0.84
pkgrel=3
pkgdesc="An efficient multimedia viewer, browser and converter."
url="http://www.xnview.com/en/xnviewmp/"

arch=('x86_64' 'i686')
license=('custom')
depends=('qt5-multimedia' 'qt5-svg' 'qt5-webkit' 'qt5-x11extras' 'desktop-file-utils')
optdepends=('gvfs: support for moving files to trash')

source_x86_64=('http://download.xnview.com/XnViewMP-linux-x64.tgz')
md5sums_x86_64=('a1202367f23f32e14a6a0d860564e1da')
source_i686=('http://download.xnview.com/XnViewMP-linux.tgz')
md5sums_i686=('75e9e03aa41da988eb66524574794b31')
source=('xnviewmp.desktop')
md5sums=('24f44d5a881b94daf48775213a57e4ec')

package() {
  install -d -m755 "${pkgdir}/opt/${pkgname}"
  install -d -m755 "${pkgdir}/usr/bin"
  install -d -m755 "${pkgdir}/usr/share/applications"

  cp -a "${srcdir}/XnView"/* "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/xnview.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${srcdir}/XnView/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Clean up
  rm "${pkgdir}/opt/${pkgname}/XnView.desktop"{,~}
  chmod -x "${pkgdir}/opt/${pkgname}/xnview.png"
}

# vim:set ts=2 sw=2 et:
