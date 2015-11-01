# Maintainer: Thor77 <thor77 at thor77 dot org>

pkgname=perl-magick
pkgver=6.9.2
srcrel=5
pkgrel=1
pkgdesc="An objected-oriented Perl interface to ImageMagick"
arch=('i686' 'x86_64')
url="http://www.imagemagick.org/script/perl-magick.php"
license=('Apache 2.0')
deps=('perl')
source=("http://www.imagemagick.org/download/ImageMagick-$pkgver-$srcrel.tar.xz")
md5sums=('f36ca5707924ccb9dffa453ab1e17d39')

build() {
        cd "$srcdir/ImageMagick-$pkgver-$srcrel"
        ./configure --prefix=/usr -with-perl
        make
}

test() {
	make test
}

package() {
        cd "$srcdir/ImageMagick-$pkgver-$srcrel"
        make DESTDIR="$pkgdir/" install
}
