# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-module-corelist'
pkgver='5.20160320'
pkgrel='1'
pkgdesc="what modules shipped with versions of perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Module-CoreList'
source=('http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/Module-CoreList-5.20160320.tar.gz')
md5sums=('48774f0c33e949d7d7ac14977dfa38de')
sha512sums=('4cb8c1467c5be46cae43c6685393fd057f0254d2e7b84fe843872d6aa704919b0bf21dff89f361e312ca0dfade1e9edfee08f05408b64ea35c6829cd75caf0f8')
_distdir="Module-CoreList-5.20160320"

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
