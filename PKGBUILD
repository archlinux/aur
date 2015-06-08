# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-regexp-reggrp'
pkgver='1.002001'
pkgrel='1'
pkgdesc="Groups a regular expressions collection"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.9')
makedepends=('perl-extutils-makemaker>=6.6302')
url='http://search.cpan.org/dist/Regexp-RegGrp'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEVESENIN/Regexp-RegGrp-1.002001.tar.gz')
md5sums=('796ff413bc7563b7185e6a185a00afef')
sha512sums=('0525e02b686616bc073de784df1e5b792c09ec033db2fe322308d40352a3a9ebd4bdafc270b4253fa29bd90cd78312bb9831aef96f55298005b7f1d1b1299ee6')
_distdir="Regexp-RegGrp-1.002001"

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
