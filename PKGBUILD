# Maintainer: Alain Kalker <a.c.kalker@gmail.com>
_pkgbase=chromiumos-ui
pkgname=$_pkgbase-service
pkgver=0.1
pkgrel=5
pkgdesc="Chromium OS user interface (systemd service)"
arch=('any')
url="http://www.chromium.org/chromium-os"
license=('GPL')
depends=('chromiumos-ui-session' 'xorg-xinit' 'matchbox-window-manager')
optdepends=('xterm: emergency terminal (use with Ctrl-Alt-X)')
install=$pkgname.install
source=($_pkgbase.service
		$_pkgbase@.service)
md5sums=('b1167ebbc97cf83fc67b7174baf5d40f'
         'a34f170ee773f750abf1275eac119bdb')

package() {
	install -Dm644 "$srcdir/$_pkgbase.service" "$pkgdir/usr/lib/systemd/system/$_pkgbase.service"
	install -Dm644 "$srcdir/$_pkgbase@.service" "$pkgdir/usr/lib/systemd/system/$_pkgbase@.service"
}
