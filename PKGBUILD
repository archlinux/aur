# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-http-server-simple-psgi'
pkgver='0.16'
pkgrel='1'
pkgdesc="PSGI handler for HTTP::Server::Simple"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-server-simple>=0.42')
makedepends=()
url='http://search.mcpan.org/dist/HTTP-Server-Simple-PSGI'
source=('http://search.mcpan.org/CPAN/authors/id/M/MI/MIYAGAWA/HTTP-Server-Simple-PSGI-0.16.tar.gz')
md5sums=('4ee6f4dee6fbf895b3fb0bb8bb9e5593')
sha512sums=('514a61a7d349f02a18b44bd2ef3adbfd457cc61b6ec4eea2e74f1d8f4ffd095b42338552ddf7e9ab2b3ffa79e5c826099665e87c9ca5b08566975101e37b0177')
_distdir="HTTP-Server-Simple-PSGI-0.16"

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
