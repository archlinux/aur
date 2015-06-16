# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-cgi-ajax'
pkgver='0.707'
pkgrel='1'
pkgdesc="CGI::Ajax"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor')
makedepends=()
url='http://search.cpan.org/dist/CGI-Ajax'
source=('http://search.cpan.org/CPAN/authors/id/B/BP/BPEDERSE/CGI-Ajax-0.707.tar.gz')
md5sums=('6efcb38dd86bbff3779adc9315cfa7d6')
sha512sums=('093c884086017b37bf4ae58b25ec96425eb896b73e528dd9b656975b9ecd9bd438db637a4b3149ccccd4108637c5cde55e6f45a92d4e865a1b0cf866bf5d8e85')
_distdir="CGI-Ajax-0.707"

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
