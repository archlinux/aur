# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=acestream-launcher
pkgver=1.0.1
pkgrel=2
pkgdesc="Acestream Launcher allows you to open Acestream links with a Media Player of your choice"
arch=("any")
url="https://github.com/jonian/acestream-launcher"
license=("GPL")
depends=("python" "curl" "acestream-engine")
optdepends=("mpv" "libnotify")
provides=("acestream-launcher")
source=("$pkgname-$pkgver::https://github.com/jonian/acestream-launcher/archive/v$pkgver.tar.gz")
md5sums=("a3a646488f1bb330160e84a55623946e")

package() {
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"

  cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"

  update-desktop-database "$pkgdir/opt/$pkgname"

  ln -s "/opt/$pkgname/acestream_launcher.py" "$pkgdir/usr/bin/acestream-launcher"
  mv "$pkgdir/opt/$pkgname/acestream-launcher.desktop" "$pkgdir/usr/share/applications/acestream-launcher.desktop"
}
