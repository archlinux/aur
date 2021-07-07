# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=nase
pkgver=0.23a
pkgrel=1
pkgdesc="NASE Algol 60 interpreter"
arch=(x86_64)
url="https://www.bertnase.de/a60"
license=('GPL2')
makedepends=(gcc make)
source=($url/a60-$pkgver.tar.gz)
sha256sums=('a84bf0c13192e3ae2300cb82aeadefaa31c5ecca784aff3b297a9dadc02dfcb4')

build() {
  cd "a60-$pkgver"

  ./configure --prefix=/usr
  make
	make xa60
}

package() {
  cd "a60-$pkgver"

	install -d "$pkgdir/usr/man/man1"
	install -d "$pkgdir/usr/lib"
	install -d "$pkgdir/usr/bin"

  make prefix="$pkgdir/usr" install
	make prefix="$pkgdir/usr" xa60-install
}
