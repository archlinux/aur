# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-cgi-emulate-psgi'
pkgver='0.23'
pkgrel='4'
pkgdesc="PSGI adapter for CGI"
arch=('any')
license=('Artistic-1.0' 'GPL-1.0+')
options=('!emptydirs')
depends=('perl-cgi>=3.63' 'perl-http-message' 'perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-requires>=0.08')
url='https://metacpan.org/release/CGI-Emulate-PSGI'
source=("https://cpan.metacpan.org/authors/id/T/TO/TOKUHIROM/CGI-Emulate-PSGI-$pkgver.tar.gz")
md5sums=('6986c3d32a3347a1f0e9ce7e7c54f046')
sha512sums=('0e1017175ccab53ef50993c9884990dc85c7cdb30744f4bac2df4486a63fd5fd24e7f4b0e473d39b1f2b4dfdcf12756016edbc39e0fb725c6c610c21e6a7f96a')
_distdir="CGI-Emulate-PSGI-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete 
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
