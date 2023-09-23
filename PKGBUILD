# Maintainer: Richard Garai <garric at okki dot hu>
pkgname=okki-status
pkgver=3.0.2
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
source=('https://git.okki.hu/garric/okki-status/archive/v3.0.2.tar.gz')
md5sums=('0ff3bcf587be41767e2eeac27de06b94')

build() {
	cd "$srcdir/$pkgname"
	make build
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
}
