# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-stacktrace-withlexicals'
pkgver='2.01'
pkgrel='1'
pkgdesc="Devel::StackTrace + PadWalker"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-devel-stacktrace>=2.00' 'perl-padwalker>=1.98' 'perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/Devel-StackTrace-WithLexicals'
source=('http://search.cpan.org/CPAN/authors/id/S/SA/SARTAK/Devel-StackTrace-WithLexicals-2.01.tar.gz')
md5sums=('bcf170645b1cbd120c4d9593f5c85fb1')
sha512sums=('ccfd415af962ce876d658b0429d8ea3491261decf4cf46b357e8c7eccac0cbabf9b227b37d2aab38a304d6caac6a895cefb6a5e2e7bfb79c547c7f4a53ab2d76')
_distdir="Devel-StackTrace-WithLexicals-2.01"

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
