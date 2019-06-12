# Maintainer: thor77 <thor77 at thor77 dot org>
# Maintainer: techMod <tausendkubik at this gmail domain>

pkgname=perl-magick
pkgver=7.0.8
srcname=ImageMagick
_srcrel=49
pkgrel=1
pkgdesc="An objected-oriented Perl interface to ImageMagick"
arch=('i686' 'x86_64')
url="http://www.imagemagick.org/script/perl-magick.php"
license=('Apache 2.0')
deps=('perl')
source=("http://www.imagemagick.org/download/$srcname.tar.gz")
md5sums=('8b7a51754973acb60dd5f8b40a8a26d5')

build() {
    tar -xvzf "$srcname.tar.gz"
    cd "$srcdir/ImageMagick-$pkgver-$_srcrel"
    ./configure --prefix=/usr -with-perl
    make
}

test() {
    make test
}

package() {
    cd "$srcdir/$srcname-$pkgver-$_srcrel"
    make DESTDIR="$pkgdir/" install
}
