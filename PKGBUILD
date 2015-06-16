# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-any-uri-escape'
pkgver='0.01'
pkgrel='1'
pkgdesc="Load URI::Escape::XS preferentially over URI::Escape"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-uri')
makedepends=()
url='https://metacpan.org/release/Any-URI-Escape'
source=('http://search.cpan.org/CPAN/authors/id/P/PH/PHRED/Any-URI-Escape-0.01.tar.gz')
md5sums=('2a1d051af8842a46bff7001678fedb55')
sha512sums=('856bf8259b86019a621cce0dae61da2bb4171221b62d5e29d41a65741917c3daae835f8239ff57fa4a7a238bea63cc9b344a9638ed6959b1dba86cde91443d0a')
_distdir="Any-URI-Escape-0.01"

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
