# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=aurupbot
pkgver=1.1
pkgrel=1
pkgdesc="A script to automatically maintain your VCS-based AUR packages for you"
arch=(any)
license=(GPL2)
url=https://github.com/ianbrunelli/aurupbot
depends=(curl git namcap pkgbuild-introspection)
optdepends=("libnotify: send desktop notifications"
            "s-nail: send reports using the mail command")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=(c4208c7d951191900f2d02e17dc9f561f8dd0558e1f53a0d12c53df448b8f3fd)

package() {
	mkdir -p "$pkgdir/usr/bin"
	install "$srcdir/$pkgname-$pkgver/aurupbot" "$pkgdir/usr/bin/aurupbot" -m 755 || return 1
	mkdir -p "$pkgdir/etc"
	install "$srcdir/$pkgname-$pkgver/aurupbotrc" "$pkgdir/etc/$aurupbotrc" -m 644 || return 1
}
