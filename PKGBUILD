# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moosex-types-json'
pkgver='1.00'
pkgrel='1'
pkgdesc="JSON datatype for Moose"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json' 'perl-moose' 'perl-moosex-types')
makedepends=()
url='https://metacpan.org/release/MooseX-Types-JSON'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MILA/MooseX-Types-JSON-1.00.tar.gz')
md5sums=('39ec7063a355ec7b0abc64ee20c94166')
sha512sums=('1dfaa8907c04ca765fc03c2049cbf076b2e29f1df34b569d91b3cc3931acde8cc7563cb186d3ea4b278ee40f1c4706f6b03139fb370d6a9d79eb7e6de21aa23f')
_distdir="MooseX-Types-JSON-1.00"

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
