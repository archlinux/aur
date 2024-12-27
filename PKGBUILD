# Maintainer: Richard Garai <garric at okki dot hu>
pkgname=okki-status
pkgver=3.2.2
pkgrel=4
pkgdesc="Status bar for the Sway window manager"
arch=('x86_64')
url="https://github.com/gar-r/$pkgname"
license=('GPL3')
depends=('go>=1.22.0' 'dbus' 'bash')
checkdepends=()
optdepends=('upower: battery module'
	'brillo: brightness module'
	'wireplumber: volume module')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/gar-r/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('2c42e5548299b66cd0384bdebfd27ce7')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
