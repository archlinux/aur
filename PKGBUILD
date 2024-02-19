# Maintainer: Heptazhou <zhou at 0h7z dot com>

pkgname_=iraf
pkgname=$pkgname_-bin
debver=2.17.1-5
pkgver=2.17.1
pkgrel=2
pkgdesc="IRAF - Image Reduction and Analysis Facility"
arch=("x86_64")
url="https://github.com/iraf-community/iraf"
license=("custom")
provides=("$pkgname_")
conflicts=("$pkgname_")
depends=("bash" "cfitsio" "expat")
optdepends=("xgterm: to start irafcl in xgterm")
options=(!debug)
source=(https://ftp.debian.org/debian/pool/main/i/iraf/${pkgname_}_${debver}_amd64.deb)
sha256sums=("72122b4274fe2db881f3ac0a9da226ba0498570311dc83efe571fd44a7df0226")
# https://packages.debian.org/sid/iraf

package() {
	cd -- "$srcdir"
	tar xf "data.tar.xz"

	mkdir "usr/share/licenses/$pkgname_" -p
	mv -T "usr/share"/{"doc/$pkgname_/copyright","licenses/$pkgname_/LICENSE"}
	rm -r "usr/share"/{"doc","lintian"} -f
	cp -t "$pkgdir" -a "usr" "etc"
}
