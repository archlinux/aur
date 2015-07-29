# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=aurupbot
pkgver=1.2
pkgrel=1
pkgdesc="A script to automatically maintain your VCS-based AUR packages for you"
arch=(any)
license=(GPL2)
url=https://github.com/ianbrunelli/aurupbot
depends=(curl git namcap pkgbuild-introspection)
optdepends=("libnotify: send desktop notifications"
            "s-nail: send reports using the mail command")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=(76a5891563f18b4b207396a0ee3636038757ecd000efd2529354fe37877279c4)

package() {
	mkdir -p "$pkgdir/usr/bin"
	install "$srcdir/$pkgname-$pkgver/aurupbot" "$pkgdir/usr/bin/aurupbot" -m 755 || return 1
	mkdir -p "$pkgdir/etc"
	install "$srcdir/$pkgname-$pkgver/aurupbotrc" "$pkgdir/etc/$aurupbotrc" -m 644 || return 1
}
