# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-cpanel-publicapi'
pkgver='1.3'
pkgrel='1'
pkgdesc="A perl interface for interacting with cPanel"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-socket-ssl>=1.33' 'perl-json-xs' 'perl-uri')
makedepends=()
url='https://metacpan.org/release/cPanel-PublicAPI'
source=('http://search.cpan.org/CPAN/authors/id/C/CP/CPANEL/cPanel-PublicAPI-1.3.tar.gz')
md5sums=('362efb85a6dc3e93ac55d375dd523a4b')
sha512sums=('80efc1c960f6b44bc4e9a04ac008b482a99112ebb65def52baac85724592ca8fb38a673cec9c7bba8a5f9463c5b32a6369ff43ddac0024efafcbabf9238f2ec3')
_distdir="cPanel-PublicAPI-1.3"

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
