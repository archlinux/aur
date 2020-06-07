# Maintainer: Stefan Haller <fgrsnau@gmail.com>
pkgname=recutils
pkgver=1.8
pkgrel=3
pkgdesc="Set of tools and libraries to access plain text databases called recfiles."
arch=(i686 x86_64)
url="https://www.gnu.org/software/recutils/"
license=('GPL')
depends=('libgcrypt')
checkdepends=('check')
# Jose E. Marchesi <jemarch.at.gnu.org>
validpgpkeys=("BDFA5717FC1DD35C2C3832A23EF90523B304AF08")
source=(
   "https://ftp.gnu.org/gnu/recutils/$pkgname-$pkgver.tar.gz"
   "https://ftp.gnu.org/gnu/recutils/$pkgname-$pkgver.tar.gz.sig"
)
sha256sums=(
   'df8eae69593fdba53e264cbf4b2307dfb82120c09b6fab23e2dad51a89a5b193'
   'SKIP'
)

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
