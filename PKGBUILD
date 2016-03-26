# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-html-dom'
pkgver='0.056'
pkgrel='1'
pkgdesc="A Perl implementation of the HTML Document Object Model"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-css-dom>=0.07' 'perl-html-encoding' 'perl-html-parser>=3' 'perl-html-tagset' 'perl-http-message' 'perl-timedate' 'perl-uri')
makedepends=()
url='https://metacpan.org/release/HTML-DOM'
source=('http://search.cpan.org/CPAN/authors/id/S/SP/SPROUT/HTML-DOM-0.056.tar.gz')
md5sums=('65efe046c73b8242bc2228baa64118ff')
sha512sums=('d3678813a543c6bd20f9b7f69f95ce070afde7bc2e7e14c9aaa3aa4f2e649701386afcd73d9bfed57aaf62e2d8876332e1980516a8de639c994e3c2c11ffd5ec')
_distdir="HTML-DOM-0.056"

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
