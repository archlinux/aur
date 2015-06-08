# Maintainer: Bruno Nova <brunomb.nova@gmail.com>
pkgname=nautilus-admin
pkgver=0.1.2
pkgrel=2
pkgdesc="Extension for Nautilus to do administrative operations"
arch=('any')
url="https://bitbucket.org/brunonova/nautilus-admin"
license=('GPL3')
depends=('nautilus' 'python-nautilus' 'polkit' 'gconf')
makedepends=('cmake>=2.6' 'gettext')
optdepends=('gedit: to use the "Edit as Administrator" action')
install="$pkgname.install"
source=("https://bitbucket.org/brunonova/$pkgname/downloads/${pkgname}_$pkgver.tar.xz")
md5sums=('49432e939f9454dcea18a66f2dfe2421')

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
