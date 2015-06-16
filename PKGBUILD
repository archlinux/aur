# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-http-request-ascgi'
pkgver='1.2'
pkgrel='1'
pkgdesc="Set up a CGI environment from an HTTP::Request"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor' 'perl-http-message' 'perl-uri')
makedepends=()
url='http://search.cpan.org/dist/HTTP-Request-AsCGI'
source=('http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/HTTP-Request-AsCGI-1.2.tar.gz')
md5sums=('82f4749a702992d405d2a8f8118e87ec')
sha512sums=('5ea9fe149c7c938af5a089fafe4585f50ea98cd6bab0e06f6de5c8b89c2b749c2cf759fdd8aa70a2d65e34971d030342924c2eafd72b9290da3831eadcc29e89')
_distdir="HTTP-Request-AsCGI-1.2"

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
