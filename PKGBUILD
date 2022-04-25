# Maintainer: Stefan Haller <fgrsnau@gmail.com>
pkgname=recutils
pkgver=1.9
pkgrel=1
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
   '6301592b0020c14b456757ef5d434d49f6027b8e5f3a499d13362f205c486e0e'
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
