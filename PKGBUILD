# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-plack-middleware-oauth'
pkgver='0.10'
pkgrel='1'
pkgdesc="Plack middleware for OAuth1, OAuth2 and builtin provider configs. "
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime' 'perl-http-message' 'perl-json-any' 'perl-libwww' 'perl-lwp-protocol-https' 'perl-net-oauth' 'perl-plack-middleware-session' 'perl-uri' 'perl-uri-query' 'perl-yaml')
makedepends=()
url='http://search.cpan.org/dist/Plack-Middleware-OAuth'
source=('http://search.cpan.org/CPAN/authors/id/C/CO/CORNELIUS/Plack-Middleware-OAuth-0.10.tar.gz')
md5sums=('c2fa55e1b2947655e66ce12017cdd5b4')
sha512sums=('4fce75a5f803e931fb26aa5327eb1c809fba04999ac6a27e750c8919160366af78b2d4930f76808b791a41999afcf049caa2cfd8c12083274524d6c0bbffe637')
_distdir="Plack-Middleware-OAuth-0.10"

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
