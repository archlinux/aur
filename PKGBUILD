# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-cgi-application-plugin-redirect'
pkgver='1.00'
pkgrel='1'
pkgdesc="Easy external redirects in CGI::Application"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cgi-application')
makedepends=()
url='http://search.cpan.org/dist/CGI-Application-Plugin-Redirect'
source=('http://search.cpan.org/CPAN/authors/id/C/CE/CEESHEK/CGI-Application-Plugin-Redirect-1.00.tar.gz')
md5sums=('138a1532ea01eb558af768bafa4283c4')
sha512sums=('7af14c87e0aa36dd78fdf6d669f07f4305a5f3ed4a3a5ccb586dc11a111ed16986e374463c73b293069751d46f1b400d4ae8cfa7072c4c82d52c480e079b12e5')
_distdir="CGI-Application-Plugin-Redirect-1.00"

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
