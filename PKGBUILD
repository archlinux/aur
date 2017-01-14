# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>
# Contributor: TBA

pkgname=kodi-standalone-socket-activation
pkgver=1.0
pkgrel=1
pkgdesc="Service files to activate kodi when the user starts a remote control app or connects to Kodi's html control port."
arch=('any')
url="https://wiki.archlinux.org/index.php/Kodi#Socket_activation"
license=('GPL')
depends=('systemd' 'kodi')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/nullptrT/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('27dd5f78af24bca54069605caa592b16198f0dddfa77e9efe88108508a0983e0')

package() {
	install -Dm644 "$srcdir/$pkgname-$pkgver/init/kodi@.service" \
		"$pkgdir/usr/lib/systemd/system/kodi@.service"
	install -Dm644 "$srcdir/$pkgname-$pkgver/init/kodi@.socket" \
                "$pkgdir/usr/lib/systemd/system/kodi@.socket"
}
