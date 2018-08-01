# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-io-bufferedselect
pkgver=1.0
pkgrel=7
pkgdesc='Line-buffered select interface'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(perl)
url=https://metacpan.org/release/IO-BufferedSelect
source=("http://search.cpan.org/CPAN/authors/id/A/AF/AFN/IO-BufferedSelect-$pkgver.tar.gz")
md5sums=(1c6013480c2acf855312c9a184816857)
sha512sums=(30bc0ebb5f62c6261938780eaf9eaa9aba2ec9ee3453c35b87614797e74399fbce9cc3aea5742078069e8131ba31ffb5ff5cafed1147b66c8f98b92b40652fc3)
_ddir=IO-BufferedSelect

build()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  unset PERL5LIB PERL_MM_OPT
  /usr/bin/perl Makefile.PL
  make
)

check()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1
  unset PERL5LIB
  make test
)

package()
(
  cd "$srcdir/$_ddir"
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
)

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
