# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-devel-lexalias'
pkgver='0.05'
pkgrel='1'
pkgdesc="alias lexical variables"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-devel-caller>=0.03')
makedepends=()
url='http://search.cpan.org/dist/Devel-LexAlias'
source=('http://search.cpan.org/CPAN/authors/id/R/RC/RCLAMP/Devel-LexAlias-0.05.tar.gz')
md5sums=('1a4f70dff1a47b3eb96bdeac50db2ec5')
sha512sums=('31f4e12d6d756790fba457f2a927d8dbf4c873033b1c83becc5c3668451041cb3ccea8c132529d35b2fd553dd34da34202ab97d25dc1c564024c68f9dd7a7367')
_distdir="Devel-LexAlias-0.05"

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
