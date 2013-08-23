# CPAN Name  : Text::Ngram
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname=perl-text-ngram
pkgver=0.14
pkgrel=1
pkgdesc='Perl package for Ngram analysis of text'
arch=('i686' 'x86_64')
url='http://search.cpan.org/dist/Text-Ngram'
license=('PerlArtistic' 'GPL')
depends=('perl')
source=(http://search.cpan.org/CPAN/authors/id/A/AM/AMBS/Text/Text-Ngram-0.14.tar.gz)
options=(!emptydirs)
md5sums=('0181102a68f3672b830b1f9e127a7af3')

build() {
  cd "$srcdir/Text-Ngram-0.14"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Text-Ngram-0.14"
  make test
}

package() {
  cd "$srcdir/Text-Ngram-0.14"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
