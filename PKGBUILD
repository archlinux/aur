# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Robert Greener <me@r0bert.dev>
pkgname=dctrl-tools
pkgver=2.24
pkgrel=2
pkgdesc="Command-line tools to process Debian package information"
arch=('x86_64')
url="https://github.com/ajkaijanaho/dctrl-tools"
license=('GPL')
groups=()
depends=('glibc>=2.14')
makedepends=(
	'gettext>=0.11'
	'debhelper>=10'
	'po4a>=0.40'
	'glibc>=2.14'
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/ajkaijanaho/dctrl-tools/archive/refs/tags/2.24.tar.gz")
noextract=()
sha512sums=("d64ef69a33437899ad7a4abbd26eca5bc92e682bcf4732cf2802c9ddb01c7eed66f48e2281a226d39d66e88207d05e1a3fe77d972ce9b51aa43f7c93929abb13")


build() {
	cd "$pkgname-$pkgver"
	# ./configure --prefix=/usr
	CFLAGS="-g -O2 -Wall -Wextra" make prefix=/usr sbindir=/usr/bin
}


check() {
	cd "$pkgname-$pkgver"
	make prefix=/usr sbindir=/usr/bin test
}

package() {
	cd "$pkgname-$pkgver"
	make prefix=/usr sbindir=/usr/bin DESTDIR="$pkgdir/" install
}