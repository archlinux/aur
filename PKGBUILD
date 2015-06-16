# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-pod-wordlist-hanekomu'
pkgver='1.132680'
pkgrel='1'
pkgdesc="Add words for spell checking POD (DEPRECATED)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
checkdepends=('perl-test-spelling' 'perl-test-eol')
url='http://search.mcpan.org/dist/Pod-Wordlist-hanekomu'
source=('http://search.mcpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Pod-Wordlist-hanekomu-1.132680.tar.gz')
md5sums=('e890599c15f0beaac5460e8586885247')
sha512sums=('ace1ef42a799608968754c780d218643493f47ade264c48e5d0a2800b31d75542ed1976afe13d8acb6a8c4b10d92b67d00638a0e0dd2647c91177eb43ae89124')
_distdir="Pod-Wordlist-hanekomu-1.132680"

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
