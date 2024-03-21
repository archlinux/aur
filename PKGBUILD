# Maintainer: Richard Garai <garric at okki dot hu>
pkgname=okki-status
pkgver=3.2.0
pkgrel=3
pkgdesc="Status bar for the Sway window manager"
arch=('x86_64')
url="https://github.com/gar-r/$pkgname"
license=('GPL3')
depends=('go>=1.21.0' 'dbus' 'bash')
checkdepends=()
optdepends=('upower: battery module'
	'brillo: brightness module'
	'wireplumber: volume module')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/gar-r/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('9adc1f2bb47f9d11167c77308842ce7c')

build() {
	cd "$srcdir/$pkgname"
	make build
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
}
