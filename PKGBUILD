# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moosex-object-pluggable'
pkgver='0.0014'
pkgrel='1'
pkgdesc="Make your classes pluggable"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-pluggable' 'perl-module-runtime' 'perl-moose' 'perl-try-tiny' 'perl-namespace-autoclean' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-fatal')
url='https://metacpan.org/release/MooseX-Object-Pluggable'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Object-Pluggable-0.0014.tar.gz')
md5sums=('bcdbeaf1928616c54bdac9f0ec93c602')
sha512sums=('0eab6798519fdf5f0b6c698112af62db9d3dade00d4e28d622f4dbabdb0d3f099ae1427d7a5913c8c6db25fc547c2b949672af1f8a58fdff2546b795814c36e5')
_distdir="MooseX-Object-Pluggable-0.0014"

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
