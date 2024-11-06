# Maintainer: Desmond Kabus <desmond.kabus@protonmail.com>

pkgname=bigjubel-git
pkgver=10.2.3.r10.gf9e3327
pkgrel=1
pkgdesc="command line utility to calculate current jubilees"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.com/dkabus/bigjubel"
license=('GPL')
depends=()
makedepends=('git' 'make' 'gcc')
provides=('bigjubel')
conflicts=('bigjubel')
source=('bigjubel-git::git+https://gitlab.com/dkabus/bigjubel')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/${pkgname}"
	make DESTDIR="$pkgdir/" install
}
