# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: MarkZZ <mark dot weiman at markzz dot com>
# Contributer: t3ddy <t3ddy1988 "at" gmail {dot} com>
# Contributor: kriation

pkgname='fluxgui'
_pkgname_='xflux-gui'
pkgver='1.1.8'
pkgrel=12
pkgdesc="(f.lux for X) Changes monitor color temperature based on time of day and position in world to ease eye strain."
arch=('i686' 'x86_64')
depends=('libindicator-gtk2' 'libdbusmenu-glib' 'libdbusmenu-gtk2' 
'libappindicator-gtk2' 'python2-pexpect' 'python2-xdg' 'python2-gconf')
makedepends=('python2-pip')
license=('MIT')
conflicts=('xflux')
url="https://justgetflux.com/"
source=("git://github.com/xflux-gui/xflux-gui")
md5sums=('SKIP')
install="${pkgname}".install
[ "$CARCH" = "x86_64" ] && depends+=('lib32-gcc-libs' 'lib32-glibc' 'lib32-libx11' 'lib32-libxau' 'lib32-libxcb' 'lib32-libxdmcp' 'lib32-libxext' 'lib32-libxxf86vm')

package() {
  cd "${srcdir}/${_pkgname_}"
  pip2 install --prefix=/usr --isolated --root="${pkgdir}" --no-deps --ignore-installed .
  install -dm644 "${pkgdir}/usr/licenses/${pkgname}/"
  cp LICENSE "${pkgdir}/usr/licenses/${pkgname}/"
}
