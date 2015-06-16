# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-test-useallmodules'
pkgver='0.14'
pkgrel='1'
pkgdesc="do use_ok() for all the MANIFESTed modules"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Test-UseAllModules'
source=('http://search.cpan.org/CPAN/authors/id/I/IS/ISHIGAKI/Test-UseAllModules-0.14.tar.gz')
md5sums=('6b108cc6ca4affe59cbd927e4c47162b')
sha512sums=('41e8b9fb6a0926c504d372fc8c7965956af2da5a6affea9b27b06e102d661c8d64c3eaeb4dd5bbc384767dc6dfc54cb47c31badd7fd69b830dc7eb83420636b6')
_distdir="Test-UseAllModules-0.14"

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
