# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-test-hasversion'
pkgver='0.012'
pkgrel='1'
pkgdesc="Check Perl modules have version numbers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Test-HasVersion'
source=('http://search.cpan.org/CPAN/authors/id/F/FE/FERREIRA/Test-HasVersion-0.012.tar.gz')
md5sums=('d9cb18aa27bbbb95b96a008248ebfb27')
sha512sums=('2435a8a8f6c1e37ffd4b697c2ab9f4c1f6a9ed73eabada1f79768735064634cac54f8d20f2993df704dd87e48b12072eee1bdb20e3005429ecb21a7de402fe83')
_distdir="Test-HasVersion-0.012"

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
