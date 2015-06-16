# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-cgi-application-plugin-session'
pkgver='1.03'
pkgrel='1'
pkgdesc="Plugin that adds session support to CGI::Application"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cgi-application>=3.21' 'perl-cgi-session>=3.95')
makedepends=()
url='http://search.cpan.org/dist/CGI-Application-Plugin-Session'
source=('http://search.cpan.org/CPAN/authors/id/C/CE/CEESHEK/CGI-Application-Plugin-Session-1.03.tar.gz')
md5sums=('4fd76fb77afc8b1cfe721b4bc0cdafbf')
sha512sums=('dce7c3db14b09614e54262279ba2627db778c0ccfa6c49e7074b32d0830779a765eba2aa5915604d5a879bbe3dc66e31e295944c7f44415b649feb9f6fd0b26a')
_distdir="CGI-Application-Plugin-Session-1.03"

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
