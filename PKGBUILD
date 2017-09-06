# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=mimetic
pkgver=0.9.8
pkgrel=1
pkgdesc="A free, MIT licensed, Email library (MIME) written in C++"
url="http://www.codesink.org/mimetic_mime_library.html"
arch=(i686 x86_64)
license=(MIT)
depends=(gcc-libs)
source=(http://www.codesink.org/download/$pkgname-$pkgver.tar.gz)
sha256sums=('3a07d68d125f5e132949b078c7275d5eb0078dd649079bd510dd12b969096700')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
