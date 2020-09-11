# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>
# Contributor: BenObiWan <benobiwan @t gmail dot com>

pkgname=zelda-xd2
pkgver=1.1.1
pkgrel=1
epoch=
pkgdesc='Free and opensource, amateur Zelda game with humoristic characters.'
arch=('any')
url='https://www.solarus-games.org/'
license=('GPL3' 'custom')
depends=('solarus>=1.6.0')
makedepends=('cmake' 'zip')
changelog="$pkgname.changelog"
source=("https://gitlab.com/solarus-games/zelda-xd2-mercuris-chess/-/archive/v$pkgver/zelda-xd2-mercuris-chess-v$pkgver.tar.gz")
b2sums=('d7d84d9d5b5b5a77f539a9b09e84f307cedae85b7a8342806954eae99f32a414ab75beb1d3b7761f29641f6356fe4b83ca7d65554ce5f80fbf3702d8c9f1d6d6')

build() {
  cd "zelda-xd2-mercuris-chess-v$pkgver" 
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "zelda-xd2-mercuris-chess-v$pkgver" 
  make DESTDIR="$pkgdir/" install
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

