# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-super'
pkgver='1.20120705'
pkgrel='2'
pkgdesc="control superclass method dispatch"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-sub-identify')
makedepends=()
url='http://search.cpan.org/dist/SUPER'
source=('http://search.cpan.org/CPAN/authors/id/C/CH/CHROMATIC/SUPER-1.20120705.tar.gz')
md5sums=('0eee5ff59b912f9baa5dc852681238a0')
sha512sums=('aa3c0fa3f17115254fa4d1486a4dcb736a5bc43db09db8d8b6bd3b992d3cbd3e1fccca5316efa7106f019c6357f0a3fe37997bdc60e7851e2f880c72700b03cd')
_distdir="SUPER-1.20120705"

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
