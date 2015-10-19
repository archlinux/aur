# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-namespace-autoclean'
pkgver='0.28'
pkgrel='1'
pkgdesc="Keep imports out of your namespace"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-b-hooks-endofscope>=0.12' 'perl-sub-identify' 'perl-namespace-clean>=0.20' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-requires')
url='https://metacpan.org/release/namespace-autoclean'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/namespace-autoclean-0.28.tar.gz')
md5sums=('9746a73c34f294d663c583f857b8648f')
sha512sums=('2541f69862b334fcfe30059d025668175de1b182a5c8ee8f2619bf1d661c316a38fe2014f274bb23e887cd36959f98abb297154ac8ceb600e2e93cbd4a75e28d')
_distdir="namespace-autoclean-0.28"

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
