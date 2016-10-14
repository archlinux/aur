# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=aurupbot
pkgver=1.3.2
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
sha256sums=("dc798b29f743bfcce2b2c68f94a55bdcccb67ed49cb2adf689a54fcb4071f30a")

package() {
  mkdir -p "$pkgdir/usr/bin"
  install "$srcdir/$pkgname-$pkgver/aurupbot" "$pkgdir/usr/bin/aurupbot" -m 755 || return 1
  mkdir -p "$pkgdir/etc"
  install "$srcdir/$pkgname-$pkgver/aurupbotrc" "$pkgdir/etc/$aurupbotrc" -m 644 || return 1
}
