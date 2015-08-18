# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-namespace-autoclean'
pkgver='0.26'
pkgrel='1'
pkgdesc="Keep imports out of your namespace"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-b-hooks-endofscope>=0.12' 'perl-sub-identify' 'perl-namespace-clean>=0.20' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-requires')
url='https://metacpan.org/release/namespace-autoclean'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/namespace-autoclean-0.26.tar.gz')
md5sums=('1fb1238dc3164a83b36779b8fb02431f')
sha512sums=('f9c0a2a4326ff10ee6e0034b157de57648fcac9d98aef1b3494ddb748a2412f6b8121b8f50cd7498fa8e7f66f6e978c3d5dbd9a7b724bb89d8e2d6a5a876dcdf')
_distdir="namespace-autoclean-0.26"

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
