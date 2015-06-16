# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-task-moose'
pkgver='0.03'
pkgrel='1'
pkgdesc="Moose in a box"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.92' 'perl-moosex-getopt' 'perl-moosex-role-parameterized')
makedepends=()
url='http://search.cpan.org/dist/Task-Moose'
source=('http://search.cpan.org/CPAN/authors/id/D/DO/DOY/Task-Moose-0.03.tar.gz')
md5sums=('bbb32442a2b1a16b4ed4c0f2d94f8142')
sha512sums=('b6a1383f1f793b1e79f73400b62ee3b6b9e54d5c5e9f9636bb8f5988b8f9aa6e6d481bdb750391bbd579bec79b30b3e2f7b6abe8cacf6b1f81b38608b0cc6f66')
_distdir="Task-Moose-0.03"

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
