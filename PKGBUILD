
# Maintainer: Aryan Ghasemi <aryan@irc>
pkgname=midnight-dler
pkgver=1
pkgrel=1
pkgdesc="downloads links and updates pacman at night. manual bios wake-on-clock settings needed for pc to wake up automatically."
arch=('any')
url="unknown"
license=('GPL')
depends=('aria2' 'yt-dlp')
provides=("$pkgname.sh")
install=${pkgname}.install
source=("$pkgname.sh"
        "$pkgname.service")
sha256sums=('11e5a5ca8f6652594c3e9ab7318f3717a4c7e021a518d699a2b6c04e0a658e01'
            '6a1b03ea5c7df622aa149eb523082da9ab4a3f0cbb8c79b49790da3b2984f4a8')

package() {
#	cd "$pkgname-$pkgver"
	install -Dm 644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm 744 $pkgname.sh "$pkgdir/usr/bin/$pkgname.sh"
}
