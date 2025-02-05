# Maintainer: Richard Garai <garric at okki dot hu>
pkgname=okki-status
pkgver=3.2.3
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
md5sums=('5c51fcc9b69b1c67c6b0c82a42b5bfc0')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
