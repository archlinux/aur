# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-plack-middleware-fixmissingbodyinredirect'
pkgver='0.12'
pkgrel='1'
pkgdesc="Plack::Middleware which sets body for redirect response, if it's not already set"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-parser' 'perl-http-message' 'perl-plack')
makedepends=()
url='https://metacpan.org/release/Plack-Middleware-FixMissingBodyInRedirect'
source=('http://search.cpan.org/CPAN/authors/id/S/SW/SWEETKID/Plack-Middleware-FixMissingBodyInRedirect-0.12.tar.gz')
md5sums=('f570ae069684cfafc099283801ad058d')
sha512sums=('1ea67f6ceb22a5cd17c4bd96f6c2169318394e490257bd13c3715dd95f397df9ccaa2c84993bcd9d799807bdd1682c030724f160cfd17d8fcf9e5096874bcce2')
_distdir="Plack-Middleware-FixMissingBodyInRedirect-0.12"

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
