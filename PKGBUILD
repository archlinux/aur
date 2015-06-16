# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-module-pluggable-fast'
pkgver='0.19'
pkgrel='1'
pkgdesc="Fast plugins with instantiation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-universal-require')
makedepends=()
url='http://search.cpan.org/dist/Module-Pluggable-Fast'
source=('http://search.cpan.org/CPAN/authors/id/M/MR/MRAMBERG/Module-Pluggable-Fast-0.19.tar.gz')
md5sums=('e0eeb561a04bb4f28a4f06774bf315f2')
sha512sums=('6c5a78693a1dfa78c87a606f5f0758334ba9fbb9578edc477e56604aa42673a230a9d94ca533fc258831e3550041a3f5c30acb03c1e0d6bcfd9575ce01fd5842')
_distdir="Module-Pluggable-Fast-0.19"

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
