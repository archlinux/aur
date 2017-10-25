# Maintainer: Joshua Merrell <joshuamerrell@gmail.com>
pkgname=minisphere
pkgver=5.0rc
pkgrel=1
pkgdesc="A fast, lightweight implementation of the Sphere game engine"
arch=('i686' 'x86_64')
url="https://github.com/fatcerberus/minisphere"
license=('BSD')
depends=('allegro5-git' 'libmng')
source=(https://github.com/fatcerberus/$pkgname/archive/v$pkgver.tar.gz)
#sha256sums=('e7c42bd51f40fc27a5a2d4991658ab0ba87436f7180dcdd9109de1d8b28d9c49')
sha256sums=('08c86342e57832fe3309ebb4bd4a46cbdc61146e3c792ea7d8b225f599c0e0f1')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
