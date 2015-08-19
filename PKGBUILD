# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-test-aggregate'
pkgver='0.372'
pkgrel='1'
pkgdesc="Aggregate *.t tests to make them run faster."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-test-most>=0.21' 'perl-test-nowarnings' 'perl-test-trap')
makedepends=()
url='https://metacpan.org/release/Test-Aggregate'
source=('http://search.cpan.org/CPAN/authors/id/R/RW/RWSTAUNER/Test-Aggregate-0.372.tar.gz')
md5sums=('a2570597400cd9c7d04cc7cf2244a55c')
sha512sums=('a7aecff7aa33f9c77e50bbfcc4153ac71652612177220756763c75319a7ac91c625d45d58fda26c10233223be2a215ee5fc220cac17b5151154aa9f9558ca46e')
_distdir="Test-Aggregate-0.372"

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
