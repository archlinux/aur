# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=acestream-launcher
pkgver=1.3.1
pkgrel=1
pkgdesc="Acestream Launcher allows you to open Acestream links with a Media Player of your choice"
arch=("any")
url="https://github.com/jonian/acestream-launcher"
license=("GPL")
depends=("python" "acestream-engine")
optdepends=("mpv" "libnotify")
makedepends=("desktop-file-utils")
provides=("acestream-launcher")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=("f547ced45d8d5f82ee4d19c22b2b0529")

package() {
  install -d "$pkgdir/opt"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"

  cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"
  ln -s "/opt/$pkgname/acestream_launcher.py" "$pkgdir/usr/bin/acestream-launcher"
  mv -n "$pkgdir/opt/$pkgname/acestream-launcher.desktop" "$pkgdir/usr/share/applications/acestream-launcher.desktop"

  update-desktop-database "$pkgdir/opt/$pkgname"
}
