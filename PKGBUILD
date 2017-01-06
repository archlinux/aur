# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=acestream-launcher
pkgver=0.5.0
pkgrel=1
pkgdesc="Acestream Launcher allows you to open Acestream links with a Media Player of your choice"
arch=("any")
url="https://github.com/jonian/acestream-launcher"
license=("GPL")
depends=("python-psutil" "python-pexpect" "python-notify2" "acestream-engine")
optdepends=("vlc")
provides=("acestream-launcher")
source=("https://github.com/jonian/acestream-launcher/archive/v$pkgver.tar.gz")
md5sums=("6136639af7b079390fc05b07b14db580")

package() {
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"

  cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"

  update-desktop-database "$pkgdir/opt/$pkgname"

  ln -s "/opt/$pkgname/acestream_launcher.py" "$pkgdir/usr/bin/acestream-launcher"
  mv "$pkgdir/opt/$pkgname/acestream-launcher.desktop" "$pkgdir/usr/share/applications/acestream-launcher.desktop"
}

