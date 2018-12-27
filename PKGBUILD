# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-plack-test-externalserver'
pkgver='0.02'
pkgrel='1'
pkgdesc="Run HTTP tests on external live servers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-message>=0' 'perl-plack>=0' 'perl-uri>=0' 'perl-libwww>=0' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-tcp>=0')
url='https://metacpan.org/release/Plack-Test-ExternalServer'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Plack-Test-ExternalServer-0.02.tar.gz')
md5sums=('9acc95e84325fa9bd7d7dc61c48addfc')
sha512sums=('cc3596c3b8601ce20887dc3116a367313a13cb7be72f76b720d628e9820df016f35b1d3f207520a33f2854529becd47a44519fcd7297c608edd318015a1cb961')
_distdir="Plack-Test-ExternalServer-0.02"

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
