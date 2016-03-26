# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-cgi-application-plugin-requiressl'
pkgver='0.04'
pkgrel='1'
pkgdesc="Force SSL in specified pages or modules"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cgi-application>=4.01')
makedepends=()
url='https://metacpan.org/release/CGI-Application-Plugin-RequireSSL'
source=('http://search.cpan.org/CPAN/authors/id/D/DH/DHORNE/CGI-Application-Plugin-RequireSSL-0.04.tar.gz')
md5sums=('ffa4fbe3014ded658dc796aafc01a5f8')
sha512sums=('81282eeb71f55038eec2e936d906c5312dedfdbcb6e5198f73fd6caf1022b56bafc3c0bb6f797ffeef0912a085374e7b5fac1ede658ea3258b3147a3f3cceae7')
_distdir="CGI-Application-Plugin-RequireSSL-0.04"

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
