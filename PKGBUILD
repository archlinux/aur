# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-cgi-application-plugin-session'
pkgver='1.05'
pkgrel='1'
pkgdesc="Plugin that adds session support to CGI::Application"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cgi-application>=3.21' 'perl-cgi-session>=4.48')
makedepends=()
url='https://metacpan.org/release/CGI-Application-Plugin-Session'
source=('http://search.cpan.org/CPAN/authors/id/F/FR/FREW/CGI-Application-Plugin-Session-1.05.tar.gz')
md5sums=('d16ff4d5fb2414944062d2b22244d476')
sha512sums=('d21369f3bbe89d4269da8071b37222e1881fce0a6933b7122dc1f976b8c862a794069348a413721716ff2d4b6778ff749564ea587cb02eadf969ed8cfcd07c05')
_distdir="CGI-Application-Plugin-Session-1.05"

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
