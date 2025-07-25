# Maintainer: Alex David <flu0r1ne@flu0r1ne.net>

pkgname=wg2nd
pkgver=0.2.1
pkgrel=3
pkgdesc="A utility to convert WireGuard configurations from wg-quick(8) format into systemd-networkd compatible configurations."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')  # Adjust architecture as necessary
url="https://www.git.flu0r1ne.net/wg2nd/about/"
license=('MIT' 'GPL-2.0')
depends=('libcap')
makedepends=('make' 'gcc' 'git')
source=("git+https://git.flu0r1ne.net/wg2nd#tag=v$pkgver")
sha256sums=('SKIP')  # Skipping the checksum since we're pulling directly from git

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make install DESTDIR="$pkgdir/" PREFIX=/usr BINDIR=/bin
	install -Dm0644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
