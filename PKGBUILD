# Maintainer: Aaron Bishop <erroneous@gmail.com>

pkgname=libstudxml
pkgver=1.0.1
pkgrel=1
depends=('gcc-libs')
makedepends=('')
pkgdesc="A streaming XML pull parser and streaming XML serializer implementation for modern, standard C++"
arch=('x86_64')
license=('MIT')
url="https://www.codesynthesis.com/projects/libstudxml/"
source=("https://www.codesynthesis.com/download/${pkgname}/1.0/${pkgname}-${pkgver}.tar.bz2")
sha1sums=('59e40dd960e202648dca6a93b491dbe8823499c7')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
