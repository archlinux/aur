# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=acestream-launcher
pkgver=0.4.0
pkgrel=1
pkgdesc="Acestream Launcher allows you to open Acestream links with a Media Player of your choice"
arch=('any')
url="https://github.com/jonian/acestream-launcher"
license=('GPL')
groups=()
depends=('python-psutil' 'python-pexpect' 'python-ptyprocess' 'python-notify2' 'acestream-engine')
makedepends=()
optdepends=('vlc')
provides=('acestream-launcher')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/jonian/acestream-launcher/archive/v$pkgver.tar.gz)
noextract=()
md5sums=('SKIP')

package() {
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"

  cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/acestream-launcher"

  sudo update-desktop-database "$pkgdir/opt/acestream-launcher"

  ln -s "/opt/acestream-launcher/acestream-launcher.py" "$pkgdir/usr/bin/acestream-launcher"
  mv "$pkgdir/opt/acestream-launcher/acestream-launcher.desktop" "$pkgdir/usr/share/applications/acestream-launcher.desktop"
}
