# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=acestream-launcher
pkgver=1.2.0
pkgrel=2
pkgdesc="Acestream Launcher allows you to open Acestream links with a Media Player of your choice"
arch=("any")
url="https://github.com/jonian/acestream-launcher"
license=("GPL")
depends=("python" "acestream-engine")
optdepends=("mpv" "libnotify")
makedepends=("desktop-file-utils")
provides=("acestream-launcher")
source=("$pkgname-$pkgver::https://github.com/jonian/acestream-launcher/archive/v$pkgver.tar.gz")
md5sums=("343acc104506dc4d8ce090bd52b2c2eb")

package() {
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"

  cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"

  update-desktop-database "$pkgdir/opt/$pkgname"

  ln -s "/opt/$pkgname/acestream_launcher.py" "$pkgdir/usr/bin/acestream-launcher"
  mv "$pkgdir/opt/$pkgname/acestream-launcher.desktop" "$pkgdir/usr/share/applications/acestream-launcher.desktop"
}
