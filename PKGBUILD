# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=libmatheval
pkgver=1.1.11
pkgrel=1
pkgdesc="A C/Fortran library to parse and evaluate symbolic expressions input as text."
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/libmatheval/"
license=('GPL3')
depends=('flex')
install=libmatheval.install
source=("http://ftp.gnu.org/gnu/libmatheval/$pkgname-$pkgver.tar.gz"
        "removeifndefs.patch")
noextract=()
md5sums=('595420ea60f6ddd75623847f46ca45c4'
         'b340ca489388a8c7986654f4be8127f4')

prepare() {
	cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/removeifndefs.patch"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
