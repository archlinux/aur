# Maintainer: Tianhao Wang <i@shrik3.com>
# this PKGBUILD is modified from aspectc++-bin (AUR, Luedecke)
# Contributor: Moritz Luedecke <ritze@skweez.net>
# Contributor: johnLate
pkgname=aspectc++-nightly-bin
pkgver=2.3
pkgrel=1
pkgdesc="Nightly build of AspectC++, a set of C++ language extensions to facilitate aspect-oriented programming with C/C++"
arch=('i686' 'x86_64')
url="http://aspectc.org/"
license=('GPL')
depends=('libxml2' 'gcc-libs')
conflicts=('aspectc++-bin')
source_i686=('https://www.aspectc.org/daily/aspectcpp-linux-daily.tar.gz')
source_x86_64=('https://www.aspectc.org/daily/aspectcpp-linux64-daily.tar.gz')
sha512sums_i686=('a124bf025d295552c081f0299d9008e2684de5bfef7b4ddf4c601e66dc4faa7d9306a7ff3f7468bb5b79d5a110e163c3eb7763b765d4ee5a4f3b527b72634447')
sha512sums_x86_64=('4defc1beb6ee9245cc018a0b3d289f16b36588eb082ab24c94e1507faa7d9d3a8f6beb3cf65db60f6f8276b72fc4f627bd13cecd29afd0d25ebbf1a454da51c7')

_dirname=aspectc++

package() {
	install -dm755 $pkgdir/usr/bin
	install -m755 "$srcdir/$_dirname/ac++" "$pkgdir/usr/bin"
	install -m755 "$srcdir/$_dirname/ag++" "$pkgdir/usr/bin"

	install -dm755 $pkgdir/usr/share/doc/aspectc++
	cp -r "$srcdir/$_dirname/examples" "$pkgdir/usr/share/doc/aspectc++"
	install -dm755 "$pkgdir/usr/share/doc/aspectc++"
}
