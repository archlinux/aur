# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-moosex-app'
pkgver='1.42'
pkgrel='1'
pkgdesc="Write user-friendly command line apps with even less suffering"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-config-any' 'perl-module-pluggable' 'perl-moose' 'perl-moosex-types-path-class' 'perl-path-class' 'perl-pod-elemental' 'perl-namespace-autoclean' 'perl')
checkdepends=('perl-test-most' 'perl-test-nowarnings')
url='https://metacpan.org/release/MooseX-App'
source=(https://cpan.metacpan.org/authors/id/M/MA/MAROS/MooseX-App-$pkgver.tar.gz)
sha256sums=('029108abf9867f3cb1d40b30d43e93921b7f339927938f427401420342a6b327')
_distdir="MooseX-App-$pkgver"

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
