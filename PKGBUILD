# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-test-checkdeps'
pkgver='0.010'
pkgrel='1'
pkgdesc="Check for presence of dependencies"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpan-meta-check>=0.007')
makedepends=()
url='http://search.cpan.org/dist/Test-CheckDeps'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Test-CheckDeps-0.010.tar.gz')
md5sums=('c1893b187e9b2efee7d40b1799218576')
sha512sums=('9683b81aa6bce358fa1abc9b2337b9b15b274742f08a3fd71e80df0bfd20619406cdded191aafdd103db8d514bdc20d36a0b60aefbd72d3de6cb117c17461697')
_distdir="Test-CheckDeps-0.010"

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
