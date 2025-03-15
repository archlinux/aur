# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-carp-assert-more'
pkgver='2.9.0'
pkgrel='1'
pkgdesc="Convenience assertions for common situations"
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl>=5.10.1')
makedepends=()
checkdepends=('perl-test-exception>=0')
url='https://metacpan.org/release/Carp-Assert-More'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/Carp-Assert-More-2.9.0.tar.gz')
md5sums=('546fd2be2e7eb0730a18fb4344ff3560')
sha512sums=('b9e6b6e0b6a0a4e80f65659e34deb5e0963c1375ab485982805dfee58922d901c1cf3fece79e20348495367903777729da3955e05f1d7546df08912ab33f7ba4')
_distdir="Carp-Assert-More-2.9.0"

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
