# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=aurupbot
pkgver=1.3.1
pkgrel=1
pkgdesc="A script to automatically maintain your VCS-based AUR packages for you"
arch=(any)
license=(GPL2)
url=https://github.com/brunelli/aurupbot
depends=(curl git namcap pkgbuild-introspection)
optdepends=("libnotify: send desktop notifications"
            "s-nail: send reports using the mail command")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("0158ffd9f7eb7ab5a1fe3ae6d0743a15ef5cea8f93e2741344bacb17f892edaa")

package() {
  mkdir -p "$pkgdir/usr/bin"
  install "$srcdir/$pkgname-$pkgver/aurupbot" "$pkgdir/usr/bin/aurupbot" -m 755 || return 1
  mkdir -p "$pkgdir/etc"
  install "$srcdir/$pkgname-$pkgver/aurupbotrc" "$pkgdir/etc/$aurupbotrc" -m 644 || return 1
}
