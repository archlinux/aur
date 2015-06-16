# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-cgi-simple'
pkgver='1.113'
pkgrel='1'
pkgdesc="A Simple totally OO CGI interface that is CGI.pm compliant"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-stringy')
makedepends=()
url='http://search.cpan.org/dist/CGI-Simple'
source=('http://search.cpan.org/CPAN/authors/id/A/AN/ANDYA/CGI-Simple-1.113.tar.gz')
md5sums=('50c50dbec87b822e3f2285e41cb23519')
sha512sums=('f2a21632ef11f2af81a3284c6f6181be15b512aa2574931bed567a4cecb44a08730193cabb2fe285e5033901838c1eebb67368af173a381bb4072f82cd32fbf0')
_distdir="CGI-Simple-1.113"

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
