# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-rest-client'
pkgver='273'
pkgrel='1'
pkgdesc="A simple client for interacting with RESTful http/https resources"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-lwp-protocol-https' 'perl-uri' 'perl-libwww' 'perl>=5.8.0')
makedepends=('perl-cgi')
url='https://metacpan.org/release/REST-Client'
source=('http://search.cpan.org/CPAN/authors/id/K/KK/KKANE/REST-Client-273.tar.gz')
md5sums=('776f74d063253b9e5d74b01adf97f060')
sha512sums=('3e41b0281929f45f3c0c1bc95e772233ab31f54f0cb2f23fe5b884636575ba131fd26eca150bab6f33fae7eddcd4de7043781e27a071306bf46b16469033a57c')
_distdir="REST-Client-273"

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
