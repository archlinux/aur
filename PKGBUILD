# Maintainer: Mike Mallin <mike@mremallin.ca>
pkgname=pmccabe
pkgver=2.7
pkgrel=1
pkgdesc="A C/C++ code complexity analyzer"
# Only tested by the maintainer on x86_64. Debian package for 'pmccabe'
# shows it building successfully on many other architectures.
# https://packages.debian.org/stable/pmccabe
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://people.debian.org/~bame/pmccabe"
license=('GPLv2')
source=("https://people.debian.org/~bame/pmccabe/$pkgname-$pkgver.tar.gz")
# No author checksum or signature available.
# This has been calculated by makepkg -g by the maintainer.
md5sums=('4d6fb27428c01bb88878003fcc673cd9')

build() {
	cd "$pkgname-$pkgver"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k test
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
