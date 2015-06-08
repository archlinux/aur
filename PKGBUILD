# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=Color-UI-theme-project
_gitcommit=c6cf24f4d3618298c6a22cb4b5ccbab93b610adb
pkgname=colorui-themes
pkgver=1.5.1.rpf2.b19
pkgrel=1
pkgdesc="Package contains 3 version of gtk3,gtk2,metacity,unity,xfwm4 and openbox theme."
arch=('any')
url="https://github.com/UserContributer/${_pkgname}"
license=('GPL3')
depends=('gnome-themes-standard' 'gtk-engine-murrine' 'gdk-pixbuf2')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_gitcommit}.tar.gz" )
sha256sums=('ce969373b9c94170eeda90f7ceafd1d349a99892120e04e3e516a7b253f75343')

package() {
  mkdir -p ${pkgdir}/usr/share/themes
  install -D -m644 ${srcdir}/${_pkgname}-${_gitcommit}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  cp -rf ${srcdir}/${_pkgname}-${_gitcommit}/Color-UI ${pkgdir}/usr/share/themes
  find ${pkgdir}/usr -type f -exec chmod 644 {} \;
  find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 
