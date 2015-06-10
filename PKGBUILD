# Maintainer: MarkZZ <mark dot weiman at markzz dot com>
# Contributer: t3ddy <t3ddy1988 "at" gmail {dot} com>
# Contributor: kriation

pkgname=fluxgui
pkgver=1.1.8
pkgrel=11
pkgdesc="(f.lux for X) Changes monitor color temperature based on time of day and position in world to ease eye strain."
arch=(i686 x86_64)
depends=('libindicator-gtk2' 'libdbusmenu-glib' 'libdbusmenu-gtk2' 
'libappindicator-gtk2' 'python2-pexpect' 'python2-xdg' 'python2-gconf')
license=('Custom')
conflicts=('xflux')
url="https://justgetflux.com/"
source=("http://ppa.launchpad.net/kilian/f.lux/ubuntu/pool/main/f/fluxgui/fluxgui_1.1.8.tar.gz")
md5sums=('f89d6f5285626f16a1f12c443c4e53b1')
install=${pkgname}.install
[ "$CARCH" = "x86_64" ] && depends+=('lib32-gcc-libs' 'lib32-glibc' 'lib32-libx11' 'lib32-libxau' 'lib32-libxcb' 'lib32-libxdmcp' 'lib32-libxext' 'lib32-libxxf86vm')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir"
}
