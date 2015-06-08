# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-uri-imap'
pkgver='1.01'
pkgrel='1'
pkgdesc="Support IMAP URI"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-uri')
makedepends=()
url='http://search.cpan.org/dist/URI-imap'
source=('http://search.cpan.org/CPAN/authors/id/C/CW/CWEST/URI-imap-1.01.tar.gz')
md5sums=('9b15c93bee6e9df3db44bf96db851ef9')
sha512sums=('1e2f86145471586b81dd06e8b52bc95f9ef406bb5ee3c9e77e74e92b93a42a63d7cf7559e2b416a72f96978a6e9a2f30798732dfd121ad82941ff261f220ea77')
_distdir="URI-imap-1.01"

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
