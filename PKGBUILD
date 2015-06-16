# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-www-facebook-api'
pkgver='0.4.18'
pkgrel='1'
pkgdesc="Facebook API implementation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-crypt-ssleay' 'perl-json-any' 'perl-libwww' 'perl-readonly')
makedepends=()
url='http://search.cpan.org/dist/WWW-Facebook-API'
source=('http://search.cpan.org/CPAN/authors/id/U/UN/UNOBE/WWW-Facebook-API-0.4.18.tar.gz')
md5sums=('35b2451a131859ddd9b87c61c36c403b')
sha512sums=('310ead09e234b8ec18f0abcbc771136dc9d86e1880b1134587b5e6372994b1fc6cd78c147e57af7b70209afae21ceb90202a0f2ba6d4954cb8cc3bcc8a558423')
_distdir="WWW-Facebook-API-0.4.18"

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
