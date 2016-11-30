# Maintainer: Thor77 <thor77 at thor77 dot org>

pkgname=perl-magick
pkgver=7.0.3
_srcrel=8
pkgrel=1
pkgdesc="An objected-oriented Perl interface to ImageMagick"
arch=('i686' 'x86_64')
url="http://www.imagemagick.org/script/perl-magick.php"
license=('Apache 2.0')
deps=('perl')
source=("http://www.imagemagick.org/download/ImageMagick-$pkgver-$_srcrel.tar.xz")
md5sums=('1a715a2fec3af2b71ed58456dca273e1')

build() {
        cd "$srcdir/ImageMagick-$pkgver-$_srcrel"
        ./configure --prefix=/usr -with-perl
        make
}

test() {
	make test
}

package() {
        cd "$srcdir/ImageMagick-$pkgver-$_srcrel"
        make DESTDIR="$pkgdir/" install
}
