# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=aurupbot
pkgver=1.3.3
pkgrel=1
pkgdesc="A script to automatically maintain your VCS-based AUR packages for you"
arch=(any)
license=(GPL2)
url=https://github.com/brunelli/aurupbot
depends=(curl git pkgbuild-introspection)
optdepends=("libnotify: send desktop notifications"
            "namcap: check built packages"
            "s-nail: send reports using the mail command")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("a0b92041e90cabc4a9387ef272d46e345b60be06cdc92eeae6d2f8ada3944a18")

package() {
  mkdir -p "$pkgdir/usr/bin"
  install "$srcdir/$pkgname-$pkgver/aurupbot" "$pkgdir/usr/bin/aurupbot" -m 755 || return 1
  mkdir -p "$pkgdir/etc"
  install "$srcdir/$pkgname-$pkgver/aurupbotrc" "$pkgdir/etc/$aurupbotrc" -m 644 || return 1
}
