# Maintainer: Desmond Kabus <desmond@kabus.eu>

pkgname=dakmoon-git
pkgver=1.0.0.r2.g62843fc
pkgrel=1
pkgdesc="calculate the current moon phase"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.com/dkabus/dakmoon"
license=('MIT')
depends=()
makedepends=('git' 'make' 'gcc' 'sed')
optdepends=(
    'imagemagick: for ascii art'
    'jp2a: for ascii art'
)
provides=('dakmoon')
conflicts=('dakmoon')
source=('dakmoon-git::git+https://gitlab.com/dkabus/dakmoon')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/${pkgname}"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
