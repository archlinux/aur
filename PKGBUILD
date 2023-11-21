# Maintainer: Alex David <flu0r1ne@flu0r1ne.net>
# Contributor: Alex David <flu0r1ne@flu0r1ne.net>
pkgname=wg2nd
pkgver=0.2.0
_pkgver=v$pkgver
pkgrel=1
pkgdesc="A utility to convert WireGuard configurations from wg-quick(8) format into systemd-networkd compatible configurations."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')  # Adjust architecture as necessary
url="https://www.git.flu0r1ne.net/wg2nd/about/"
license=('MIT' 'GPL')
depends=('libcap')
makedepends=('make' 'gcc')
source=("git+git://git.flu0r1ne.net/wg2nd.git#tag=$_pkgver")
sha256sums=('SKIP')  # Skipping the checksum since we're pulling directly from git

build() {
	cd "$srcdir/$pkgname"

	# Build using make
	make
}

package() {
	cd "$srcdir/$pkgname"

	# Run 'make install' with DESTDIR set to the package directory
	make DESTDIR="$pkgdir/" install
}

