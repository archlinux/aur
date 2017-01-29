# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: casa <sympho08@yandex.ru>

pkgname=mednaffe 
pkgver=0.8.4
pkgrel=1
pkgdesc="front-end (GUI) for mednafen emulator"
arch=('i686' 'x86_64')
url="https://sites.google.com/site/amatcoder/mednaffe"
license=('GPL')
depends=('mednafen' 'gtk3')
source=(https://sites.google.com/site/amatcoder/mednaffe/downloads/$pkgname-$pkgver.tar.gz)
sha1sums=('74a7283522b75eb5dda209595cbe434708fd608f')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-gtk3
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make prefix="$pkgdir"/usr install
}
