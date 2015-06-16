# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-module-install-authortests'
pkgver='0.002'
pkgrel='1'
pkgdesc="designate tests only run by module authors"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-install')
makedepends=()
url='http://search.cpan.org/dist/Module-Install-AuthorTests'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Module-Install-AuthorTests-0.002.tar.gz')
md5sums=('f1b95c8385c1284e281a9bc6a5f10532')
sha512sums=('13f3c9018171500ec0090f5f634508b3b0b9554fe9b02cf47f008d1e0005358e1b7d65b4b1347c86aff93da6ae60f0e5c1bdcb1f8c01de727231d3481b5b7153')
_distdir="Module-Install-AuthorTests-0.002"

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
