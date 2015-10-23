# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=acestream-proxy-player
pkgver=0.2.1
pkgrel=2
pkgdesc="Aceproxy Player allows you to open Ace Stream links with a Media Player of your choice"
arch=('any')
url="https://github.com/jonian/acestream-proxy-player"
license=('GPL')
groups=()
depends=('python2-psutil' 'python2-urllib3' 'acestream-proxy')
makedepends=()
optdepends=('vlc')
provides=('acestream-proxy-player')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/jonian/acestream-proxy-player/archive/v$pkgver.tar.gz)
noextract=()
md5sums=('SKIP')

package() {
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"

  cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/aceproxy-player"

  sudo update-desktop-database "$pkgdir/opt/aceproxy-player"

  ln -s "/opt/aceproxy-player/aceproxy-player.py" "$pkgdir/usr/bin/aceproxy-player"
  mv "$pkgdir/opt/aceproxy-player/aceproxy-player.desktop" "$pkgdir/usr/share/applications/aceproxy-player.desktop"
}
