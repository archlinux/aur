# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=plasma5-applets-presentwindows
pkgver=8
pkgrel=2
pkgdesc="Plasma 5 widget for triggering the present windows desktop effect with a click"
arch=(any)
url="https://github.com/Zren/plasma-applet-presentwindows"
license=(GPL2)
depends=(plasma-workspace)
makedepends=(kconfig5 git)
#v8 was noted in commits but not released as a tarball or tagged
_commit='3bf0ce226ed068e640d154d9a9d1a4d28ef6d5f7'
source=("${pkgname}::git+https://github.com/Zren/plasma-applet-presentwindows#commit=${_commit}")
sha256sums=('SKIP')
#source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Zren/plasma-applet-presentwindows/archive/v${pkgver}.tar.gz")
#ha256sums=('7baf3d7f6826771136bc58826724eaa7e8b721a40af5cab3566e8836d8a891fc')

package() {
  _appletname="$( kreadconfig5 --file="$srcdir"/${pkgname}/package/metadata.desktop --group="Desktop Entry" --key="X-KDE-PluginInfo-Name" )"
  mkdir -p "${pkgdir}/usr/share/plasma/plasmoids"
  cp -r "${srcdir}/${pkgname}/package" "${pkgdir}/usr/share/plasma/plasmoids/${_appletname}"
  rm -fr "${pkgdir}/usr/share/plasma/plasmoids/${_appletname}"/translate
}
