# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=aurupbot
pkgver=1.0.2
pkgrel=1
pkgdesc="A script to automatically maintain your VCS-based AUR packages for you"
arch=(any)
license=(GPL2)
url=https://github.com/ianbrunelli/aurupbot
depends=(curl git namcap pkgbuild-introspection)
optdepends=("libnotify: send desktop notifications"
            "s-nail: send reports using the mail command")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=(cd588eb039331c7a3c2098658e257a28bfc075e013dce00a0beba14fda8a8f21)

package() {
	mkdir -p "$pkgdir/usr/bin"
	install "$srcdir/$pkgname-$pkgver/aurupbot" "$pkgdir/usr/bin/aurupbot" -m 755 || return 1
	mkdir -p "$pkgdir/etc"
	install "$srcdir/$pkgname-$pkgver/aurupbotrc" "$pkgdir/etc/$aurupbotrc" -m 644 || return 1
}
