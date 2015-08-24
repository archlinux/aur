# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=aurupbot
pkgver=1.3
pkgrel=1
pkgdesc="A script to automatically maintain your VCS-based AUR packages for you"
arch=(any)
license=(GPL2)
url=https://github.com/ianbrunelli/aurupbot
depends=(curl git namcap pkgbuild-introspection)
optdepends=("libnotify: send desktop notifications"
            "s-nail: send reports using the mail command")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=(de2e094aed6db512b2249d7d06c3a5283addda645feed026d05920f1eaffdaae)

package() {
	mkdir -p "$pkgdir/usr/bin"
	install "$srcdir/$pkgname-$pkgver/aurupbot" "$pkgdir/usr/bin/aurupbot" -m 755 || return 1
	mkdir -p "$pkgdir/etc"
	install "$srcdir/$pkgname-$pkgver/aurupbotrc" "$pkgdir/etc/$aurupbotrc" -m 644 || return 1
}
