# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-path-isdev'
pkgver='1.001003'
pkgrel='1'
pkgdesc="Determine if a given Path resembles a development source tree"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-tiny>=0.010' 'perl-file-homedir' 'perl-module-runtime' 'perl-path-tiny>=0.004' 'perl-role-tiny' 'perl-sub-exporter')
makedepends=()
checkdepends=('perl-test-fatal')
url='https://metacpan.org/release/Path-IsDev'
source=('http://search.cpan.org/CPAN/authors/id/K/KE/KENTNL/Path-IsDev-1.001003.tar.gz')
md5sums=('b612d903d990259ba98a611972f7c0ad')
sha512sums=('fd4e355d0e67ec210eba443d5867dce181664da6ae300d81b98e77fd78a25d5a4f95e0b901f0a6c7596f28a3e2e37264f31226c410f5e6fb6a565d2ef0618d59')
_distdir="Path-IsDev-1.001003"

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
