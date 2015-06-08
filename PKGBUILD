# Maintainer: Bruno Nova <brunomb.nova@gmail.com>
pkgname=nautilus-hide
pkgver=0.1.2
pkgrel=1
pkgdesc="Extension for Nautilus to hide files without renaming them"
arch=('any')
url="https://bitbucket.org/brunonova/nautilus-hide"
license=('GPL3')
depends=('nautilus' 'python-nautilus')
makedepends=('cmake>=2.6' 'gettext')
install="$pkgname.install"
source=("https://bitbucket.org/brunonova/$pkgname/downloads/${pkgname}_$pkgver.tar.xz")
md5sums=('d5e435e1f37f7122002010d6f6080208')

build() {
	cd "$srcdir"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir"
	make DESTDIR="$pkgdir" install
	install -Dm644 "README.mkd" "$pkgdir/usr/share/doc/$pkgname/README.mkd"
}
