# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-cpanel-publicapi'
pkgver='1.002'
pkgrel='1'
pkgdesc="A perl interface for interacting with cPanel"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-socket-ssl>=1.33' 'perl-json-xs>=2' 'perl-uri')
makedepends=()
url='http://search.cpan.org/dist/cPanel-PublicAPI'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MATTDEES/cPanel-PublicAPI-1.002.tar.gz')
md5sums=('4028cfd9df5ae77a292ebda1317e7e66')
sha512sums=('bff4f88e2087f55cbfd3e8eead3bcd87f4a46db23c3bdcb326f5573cd74056dca40c7051c1a92daf844c6d5ed99b55cf34975c2d5d4b783c2f375d6ec1cc3829')
_distdir="cPanel-PublicAPI-1.002"

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
