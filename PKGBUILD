# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-prefork'
pkgver='1.05'
pkgrel='1'
pkgdesc="Optimized module loading for forking or non-forking processes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/prefork'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/prefork-1.05.tar.gz')
md5sums=('60d97a66a1e6e4ccfa51f8662a511048')
sha512sums=('38185a8ff3016a562b4ef0db8c4d6bb065ca1f2f6f661700aff2727c80b45aaca84b5ab23a8e66ce3b65c9b418e85fb65eec982e27fec847a4d939f4385365c6')
_distdir="prefork-1.05"

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
