# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=perl-syntax-highlight-perl
_perlmod=Syntax-Highlight-Perl
pkgver=1.0
pkgrel=4
pkgdesc="Syntax-Highlight-Perl perl module (highlighting of Perl Syntactical Structures)"
arch=("any")
url="http://search.cpan.org/~johnsca/Syntax-Highlight-Perl/"
license=("GPL" "Artistic")
depends=('perl>=5.10.0')
source=(http://search.cpan.org/CPAN/authors/id/J/JO/JOHNSCA/$_perlmod-$pkgver.tar.gz)
md5sums=('bb207d9fff5298dddd3e6295c23a5f87')
options=(!emptydirs)

build() {
  cd $srcdir/$_perlmod-$pkgver

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd $srcdir/$_perlmod-$pkgver
  make install DESTDIR="$pkgdir/"
}
