# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-net-google-authsub'
pkgver='0.5'
pkgrel='3'
pkgdesc="interact with sites that implement Google style AuthSub"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-uri' 'perl-libwww')
makedepends=()
url='https://metacpan.org/release/Net-Google-AuthSub'
source=('http://search.cpan.org/CPAN/authors/id/S/SI/SIMONW/Net-Google-AuthSub-0.5.tar.gz')
md5sums=('edd1363bd9db1e96d2cd2d4893d62537')
sha512sums=('3a9fcae4dd58574dbe14f14704969fbb366c338eae9b5099c9cac7c67be4c054b482c13310e7a9ef0bed5cd52745b2bb0de1985854f61005adfe5c3e7d9e65cf')
_distdir="Net-Google-AuthSub-0.5"

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
