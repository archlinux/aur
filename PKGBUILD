pkgname=hex-a-hop
pkgver=1.1.0
pkgrel=1
pkgdesc="A puzzle game based on hexagonal tiles"
arch=('i686' 'x86_64')
url="http://hexahop.sourceforge.net"
license=('GPL2')
depends=('sdl' 'sdl_mixer' 'sdl_ttf')
source=(
  "https://downloads.sourceforge.net/project/hexahop/1.1.0/hex-a-hop-1.1.0.tar.gz"
  "hex-a-hop.desktop"
  "hex-a-hop.png"
)
md5sums=('cc8d065c2cc0fce9e08852b8c465175e'
         '67da57b51973a20e11d94c4f557d8b1f'
         '2198fd14ecc349f89e39b21eef012431')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  cd ..
  install -Dm644 hex-a-hop.desktop "$pkgdir/usr/share/applications/hex-a-hop.desktop"
  install -Dm644 hex-a-hop.png "$pkgdir/usr/share/icons/hex-a-hop.png"
}
