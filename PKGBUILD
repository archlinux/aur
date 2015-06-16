# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-moosex-app'
pkgver='1.33'
pkgrel='1'
pkgdesc="Write user-friendly command line apps with even less suffering"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-config-any' 'perl-module-pluggable' 'perl-moose>=2.00' 'perl-moosex-types-path-class' 'perl-path-class' 'perl-pod-elemental' 'perl-namespace-autoclean' 'perl>=5.10.0')
makedepends=()
checkdepends=('perl-test-most' 'perl-test-nowarnings')
url='https://metacpan.org/release/MooseX-App'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MAROS/MooseX-App-1.33.tar.gz')
md5sums=('f52717ab0bc69c57c3d0d60deb5203df')
sha512sums=('48746b1d4ccfdc102e176f8c5327ba23e5d5a6c14eba36fadc6e9708f9b5edc41ba273fbb089c9d1a79f29e7d64d740f0b22d5f4ac5b89c92628a63d28235b23')
_distdir="MooseX-App-1.33"

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
