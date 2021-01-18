# Maintainer: Tim Yang <protonmail = timdyang>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-spotify
pkgver=3.3
pkgrel=1
pkgdesc="Spotify for Nuvola Player 3"
arch=(any)
url=https://github.com/tiliado/$pkgname
license=(BSD)
depends=(nuvolaplayer flashplayer gst-plugins-ugly gst-plugins-good)
makedepends=(python-nuvolasdk scour)
conflicts=($pkgname-git)
source=(https://github.com/tiliado/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('1ed167bf347db4c1c3897c30d145f4f698bb5ca9cb016569dde1117c4f2f2439')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr
  make all
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
