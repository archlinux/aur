# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-syntax-keyword-junction'
pkgver='0.003008'
pkgrel='1'
pkgdesc="Perl6 style Junction operators in Perl5"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-sub-exporter-progressive>=0.001006' 'perl-syntax')
makedepends=()
checkdepends=('perl-test-requires>=0.07')
url='https://metacpan.org/release/Syntax-Keyword-Junction'
source=('http://search.cpan.org/CPAN/authors/id/F/FR/FREW/Syntax-Keyword-Junction-0.003008.tar.gz')
md5sums=('c20b4f6aa92c30808c8efaecc9463911')
sha512sums=('e09229bf28e4af240088de3836cd666273d2b6be18148c5e7955b6c0509e18392e39e28d4d6c6a52bc52cd19ce47a7ca5138187b9103562ca9fa0eeeaa33a98c')
_distdir="Syntax-Keyword-Junction-0.003008"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
