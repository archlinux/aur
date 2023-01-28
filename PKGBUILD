# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-net-oauth2-authorizationserver'
pkgver='0.28'
pkgrel='1'
pkgdesc="Easier implementation of an OAuth2"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-crypt-jwt>=0.023' 'perl-cryptx>=0.021' 'perl-moo>=2.000002' 'perl-try-tiny>=0.22' 'perl-type-tiny>=0' 'perl>=5.10.1')
makedepends=()
checkdepends=('perl-test-exception>=0.32' 'perl-test-most>=0')
url='https://metacpan.org/release/Net-OAuth2-AuthorizationServer'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/Net-OAuth2-AuthorizationServer-0.28.tar.gz')
md5sums=('500a542e0ed124f1e19859873f5801a0')
sha512sums=('80b24aca6c20b52c0405632359160afc35155547adef7feb98b8bcf9231944a0351082c9f3f75c8d9ff7e3320f39ce1c94e01be3bccef5a972ce091108ca74fb')
_distdir="Net-OAuth2-AuthorizationServer-0.28"

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
