# Maintainer: Alain Kalker <a.c.kalker@gmail.com>
_pkgbase=chromiumos-ui
pkgname=$_pkgbase-session
pkgver=0.4
pkgrel=3
pkgdesc="Chromium OS user interface (display manager session)"
arch=('any')
url="http://www.chromium.org/chromium-os"
license=('GPL')
depends=('chromiumos-ui' 'matchbox-window-manager')
source=($_pkgbase.session
	$_pkgbase-lastuser.session
	$pkgname.sh)
md5sums=('141fb7abef51fee459d193300003611a'
         '512a7421e124b24cb3e822d0b637b4bc'
         '1b8dda2e9b4657313a7c14a0cdb8791f')

package() {
	install -Dm644 "$srcdir/$_pkgbase.session" "$pkgdir/usr/share/xsessions/$_pkgbase.desktop"
	install -Dm644 "$srcdir/$_pkgbase-lastuser.session" "$pkgdir/usr/share/xsessions/$_pkgbase-lastuser.desktop"
	install -D "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
