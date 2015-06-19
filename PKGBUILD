# Maintainer: Mikkel Kroman <mk@maero.dk>

pkgname=sqlpp11
pkgver=0.34
pkgrel=1
pkgdesc="A type safe embedded domain specific language for SQL queries and results in C++"
arch=('any')
url="https://github.com/rbock/sqlpp11"
license=('BSD')
depends=()
makedepends=('cmake')
source=("https://github.com/rbock/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('ba102151a5afba6a5133785f994b3edc1096592688bedbe018ed2fff5d9a699b')

build() {
	cd "$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

check() {
  cd "$pkgname-$pkgver"
  # make test
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

  mkdir -p "${pkgdir}/usr/share/licenses/sqlpp11"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/sqlpp11/LICENSE"
}
