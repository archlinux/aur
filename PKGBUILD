# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-plack-middleware-session'
pkgver='0.30'
pkgrel='1'
pkgdesc="Middleware for session management"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cookie-baker' 'perl-digest-hmac' 'perl-digest-sha1' 'perl-http-cookies' 'perl-plack>=0.9910' 'perl-libwww')
makedepends=()
checkdepends=('perl-test-fatal>=0.006' 'perl-test-requires')
url='https://metacpan.org/release/Plack-Middleware-Session'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Plack-Middleware-Session-0.30.tar.gz')
md5sums=('ab0862938cb3141626f0849b035c427a')
sha512sums=('9de810768096b51e644e2594202b03e681449e8125b74deeeb4363791e22f84498df90b5717495573dea60e907f432f32f8d42c7b335a6c98f8c44df7f96b2e5')
_distdir="Plack-Middleware-Session-0.30"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
