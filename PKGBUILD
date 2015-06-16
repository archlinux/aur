# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-module-runtime-conflicts'
pkgver='0.002'
pkgrel='1'
pkgdesc="Provide information on conflicts for Module::Runtime"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-checkconflicts' 'perl-module-runtime')
makedepends=()
url='https://metacpan.org/release/Module-Runtime-Conflicts'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Module-Runtime-Conflicts-0.002.tar.gz')
md5sums=('6171a55eb2937b4429bed8dfd75080a9')
sha512sums=('e07ee4e7707b6c8ee52afc01f7fb7e8a04fc9ab3f3e4624fa7f4011bb314aa77aa0e060c58592e3bc21d9fb6d9d83190bb655b43940e79a4d95557ce720530af')
_distdir="Module-Runtime-Conflicts-0.002"

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
