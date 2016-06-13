# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-useallmodules'
pkgver='0.17'
pkgrel='1'
pkgdesc="do use_ok() for all the MANIFESTed modules"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Test-UseAllModules'
source=('http://search.cpan.org/CPAN/authors/id/I/IS/ISHIGAKI/Test-UseAllModules-0.17.tar.gz')
md5sums=('aa7168526e2b3ec54fc705c6e260fbf6')
sha512sums=('6aa768dded4b3ebe604bc616a8a1b09845c0dbd91fcdba2b10e787e5ba3604cb18d9dfcfb9f5e4fef0d3d5d44c8722d99394843e4a14e1bee4dbb1463ef4bcd8')
_distdir="Test-UseAllModules-0.17"

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
