# Maintainer: Richard Garai <garric at okki dot hu>
pkgname=okki-status
pkgver=3.1.1
pkgrel=1
pkgdesc="Status bar for the Sway window manager"
arch=('x86_64')
url="https://git.okki.hu/garric/okki-status"
license=('GPL3')
depends=('go>=1.21.0' 'dbus' 'bash')
checkdepends=()
optdepends=('upower: battery module'
	'brillo: brightness module'
	'wireplumber: volume module')
source=('https://git.okki.hu/garric/okki-status/archive/v3.1.1.tar.gz')
md5sums=('018ac54d9a429295e557ff8ebb553cef')

build() {
	cd "$srcdir/$pkgname"
	make build
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
}
