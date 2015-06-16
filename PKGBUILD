# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-namespace-autoclean'
pkgver='0.24'
pkgrel='1'
pkgdesc="Keep imports out of your namespace"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-b-hooks-endofscope>=0.12' 'perl-sub-identify' 'perl-namespace-clean>=0.20')
makedepends=()
checkdepends=('perl-test-requires')
url='https://metacpan.org/release/namespace-autoclean'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/namespace-autoclean-0.24.tar.gz')
md5sums=('b0642f870ef4d0b77c1ec5fe5123685b')
sha512sums=('6fb224e27b631c8b8f14936812d40fe69a5a8e33a0afffd5a4a1e7bb26a2afacdf6179744621fa2eb5540d151676e81ad375de2d76d52c004252ff3304f4552c')
_distdir="namespace-autoclean-0.24"

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
