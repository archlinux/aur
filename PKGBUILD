# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=acestream-proxy-player
pkgver=0.3.0
pkgrel=1
pkgdesc="Aceproxy Player allows you to open Ace Stream links with a Media Player of your choice"
arch=('any')
url="https://github.com/jonian/acestream-proxy-player"
license=('GPL')
groups=()
depends=('python-psutil' 'python-urllib3' 'python-notify2')
makedepends=()
optdepends=('acestream-proxy' 'vlc')
provides=('acestream-proxy-player')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/jonian/acestream-proxy-player/archive/v$pkgver.tar.gz")
noextract=()
md5sums=('SKIP')

package() {
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"

  cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/aceproxy-player"

  update-desktop-database "$pkgdir/opt/aceproxy-player"

  ln -s "/opt/aceproxy-player/aceproxy-player.py" "$pkgdir/usr/bin/aceproxy-player"
  mv "$pkgdir/opt/aceproxy-player/aceproxy-player.desktop" "$pkgdir/usr/share/applications/aceproxy-player.desktop"
}
