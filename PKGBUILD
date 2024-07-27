# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=zip2hashcat-git
pkgver=1.0.r1.462bd94
pkgrel=1
pkgdesc='Processes input ZIP files into a format suitable for use with hashcat'
arch=('x86_64')
url='https://github.com/hashstation/zip2hashcat'
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/hashstation/zip2hashcat.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make zip2hashcat
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 zip2hashcat "$pkgdir/usr/bin/zip2hashcat"
}
