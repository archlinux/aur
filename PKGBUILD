# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-alien-wxwidgets'
pkgver='0.64'
pkgrel='1'
pkgdesc="building, finding and using wxWidgets binaries"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Alien-wxWidgets'
source=('http://search.cpan.org/CPAN/authors/id/M/MD/MDOOTSON/Alien-wxWidgets-0.64.tar.gz')
md5sums=('12b6492a87cf165a4f0cd7254ccfab11')
sha512sums=('4b687527936dc88fcf35e103bb6effea2dffaf2e313d2ff4a6000a20d240fcb0bde165dbf92f2cc8e2ddf1780f58e585001c261413cfc2ca53c0c617acbeb359')
_distdir="Alien-wxWidgets-0.64"

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
