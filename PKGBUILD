# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=sopcast-launcher
pkgver=0.5.0
pkgrel=1
pkgdesc="Sopcast Launcher allows you to open Sopcast links with a Media Player of your choice"
arch=("any")
url="https://github.com/jonian/sopcast-launcher"
license=("GPL")
depends=("python-psutil" "python-notify2" "sopcast")
optdepends=("vlc")
makedepends=("desktop-file-utils")
provides=("sopcast-launcher")
source=("$pkgname-$pkgver::https://github.com/jonian/sopcast-launcher/archive/v$pkgver.tar.gz")
md5sums=("0eb32ee8d45d67bdd40e21c388733a86")

package() {
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"

  cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"

  update-desktop-database "$pkgdir/opt/$pkgname"

  ln -s "/opt/$pkgname/sopcast_launcher.py" "$pkgdir/usr/bin/sopcast-launcher"
  mv "$pkgdir/opt/$pkgname/sopcast-launcher.desktop" "$pkgdir/usr/share/applications/sopcast-launcher.desktop"
}
