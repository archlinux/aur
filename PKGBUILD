# Maintainer: Sergey Shatunov <me@prok.pw>

pkgname=networkmanager-iwd-overlay
pkgver=1.1
pkgrel=1
pkgdesc="Configure NetworkManager to use iwd instead of wpa_supplicant"
arch=('any')
url="https://wiki.gnome.org/Projects/NetworkManager"
license=(GPL2 LGPL2.1)
depends=(networkmanager iwd)
provides=(wpa_supplicant=0)
source=('10-wifi-backend.conf'
        '50-networkmanager.conf'
        '50-iwd.conf')
sha256sums=('bc39a5cf9a99c73af9056b58396b070095a3711c21fbc5be9e4cb7e2109a8a9e'
            '0779c650249a92688cec7b6ed641b6600da0a8bf65c5c3adc778ea6b4c6406c0'
            '2c6e8ac8f2f8b169e84cfb0e4a641ff5e7aa1e7bad1f621dc66403dc5eaadab5')

package() {
	install -Dm644 "$srcdir/10-wifi-backend.conf" -t "$pkgdir/usr/lib/NetworkManager/conf.d"
	install -Dm644 "$srcdir/50-networkmanager.conf" -t "$pkgdir/usr/lib/systemd/system/iwd.service.d"
	install -Dm644 "$srcdir/50-iwd.conf" -t "$pkgdir/usr/lib/systemd/system/NetworkManager.service.d"
}
