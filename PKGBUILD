# Maintainer: sg

pkgname=pacgui
pkgver=13.50a4429
pkgrel=1
pkgdesc="System updates with a simple pacman GUI, based on Zenity"
arch=('any')
license=('GPLv3')
url="https://gitlab.com/it-me/pacgui"
install=${pkgname}.install
depends=('zenity' 'pacman-contrib')
source=('git+https://gitlab.com/it-me/pacgui')
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
	install -m755 -D ${srcdir}/${pkgname}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}.sh
	install -m644 -D ${srcdir}/${pkgname}/${pkgname}.service ${pkgdir}/usr/lib/systemd/user/${pkgname}.service
	install -m644 -D ${srcdir}/${pkgname}/${pkgname}.timer ${pkgdir}/usr/lib/systemd/user/${pkgname}.timer
	install -m644 -D ${srcdir}/${pkgname}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
