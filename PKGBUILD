# Maintainer: archlinux.info:tdy
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-spotify
pkgver=2.3
pkgrel=1
pkgdesc="Spotify for Nuvola Player 3"
arch=(any)
url=https://github.com/tiliado/$pkgname
license=(BSD)
depends=(nuvolaplayer flashplayer gst-plugins-ugly gst-plugins-good)
makedepends=(python-nuvolasdk scour)
conflicts=($pkgname-git)
source=(https://github.com/tiliado/$pkgname/archive/$pkgver.tar.gz)
sha256sums=(1f287a8685addd39974478359f483c1f96c6e7ac3755974857d1302f15669ddc)

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make all
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install LICENSE -m 644 -Dt "$pkgdir"/usr/share/licenses/$pkgname/
}
