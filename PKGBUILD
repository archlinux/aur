# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=sopcast-launcher
pkgver=0.4.0
pkgrel=1
pkgdesc="Sopcast Launcher allows you to open Sopcast links with a Media Player of your choice"
arch=('any')
url="https://github.com/jonian/sopcast-launcher"
license=('GPL')
groups=()
depends=('python-psutil' 'python-notify2' 'sopcast')
makedepends=()
optdepends=('vlc')
provides=('sopcast-launcher')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/jonian/sopcast-launcher/archive/v$pkgver.tar.gz)
noextract=()
md5sums=('SKIP')

package() {
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"

  cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/sopcast-launcher"

  sudo update-desktop-database "$pkgdir/opt/sopcast-launcher"

  ln -s "/opt/sopcast-launcher/sopcast-launcher.py" "$pkgdir/usr/bin/sopcast-launcher"
  mv "$pkgdir/opt/sopcast-launcher/sopcast-launcher.desktop" "$pkgdir/usr/share/applications/sopcast-launcher.desktop"
}
