# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-module-info'
pkgver='0.34'
pkgrel='1'
pkgdesc="Information about Perl modules"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Module-Info'
source=('http://search.cpan.org/CPAN/authors/id/M/MB/MBARBON/Module-Info-0.34.tar.gz')
md5sums=('13a912e1ddbca467d4e15e3a7f0acd0c')
sha512sums=('50f79e0698d9daae975e2de774c1bfbdde9c0a9dd3a7eaedfd8659ec7afd495711fe49510e4c7f64092abfeb58e670f2a586cc9a112777c8c5ad64f122dd3948')
_distdir="Module-Info-0.34"

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
