# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Lukas Weber <laochailan@web.de>

pkgname=taisei
pkgver=1.0a
pkgrel=2
pkgdesc="Open source Touhou clone"
arch=('i686' 'x86_64')
url="http://taisei-project.org/"
license=('MIT')
depends=('sdl_ttf' 'hicolor-icon-theme' 'mesa' 'libpng' 'freealut' 'glu')
makedepends=('git' 'cmake')
install=taisei.install
source=($pkgname-$pkgver.tar.gz::"https://github.com/laochailan/taisei/archive/v$pkgver.tar.gz")
sha256sums=('1561c84c9fd8b9c7a91b864bdfc07fb811bb6da5c54cf32a2b6bd63de5f8f3ff')

build() {
  cd $pkgname-$pkgver

  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
  # license
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
