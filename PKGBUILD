# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-tree-simple-visitorfactory'
pkgver='0.10'
pkgrel='1'
pkgdesc="A factory object for dispensing Visitor objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-tree-simple>=1.12')
makedepends=('perl-test-exception>=0.15')
url='http://search.cpan.org/dist/Tree-Simple-VisitorFactory'
source=('http://search.cpan.org/CPAN/authors/id/S/ST/STEVAN/Tree-Simple-VisitorFactory-0.10.tar.gz')
md5sums=('ff7803a452e7fb188c71048cc2f69f6e')
sha512sums=('9f6fb71c78709d392b6a1b8f9863672b314f2bc5f09b1410f65bca5bd6fc75e39a5d11360dc3c5fd4945c5334244d2d71b1c75203bece927fad4d624a3731a69')
_distdir="Tree-Simple-VisitorFactory-0.10"

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
