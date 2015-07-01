# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=perl-panotools-script
pkgver=0.28
pkgrel=1
pkgdesc="Perl/CPAN Module Panotools::Script : Panorama Tools scripting"
arch=('any')
url="http://search.cpan.org/dist/Panotools-Script/"
license=("GPL2")
depends=('perl')
checkdepends=('hugin')
optdepends=('zenity: GUI' 'enblend-enfuse: enblend-* enfuse-* scripts' \
            'imagemagick: entile' 'perl-image-size: erect2* and few other scripts' \
            'hugin: tools for generating panorama projects')
source=(http://search.cpan.org/CPAN/authors/id/B/BP/BPOSTLE/Panotools-Script-$pkgver.tar.gz)
md5sums=('c4b15c5672a2d757ca46fd87cc536a91')

build() {
  cd "$srcdir"/Panotools-Script-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir"/Panotools-Script-$pkgver
  make -k test
}

package() {
  cd "$srcdir"/Panotools-Script-$pkgver
  make install DESTDIR="$pkgdir"  
}
