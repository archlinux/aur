# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-carp-assert-more'
pkgver='2.5.0'
pkgrel='1'
pkgdesc="Convenience assertions for common situations"
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl>=5.10.1')
makedepends=()
checkdepends=('perl-test-exception>=0')
url='https://metacpan.org/release/Carp-Assert-More'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/Carp-Assert-More-2.5.0.tar.gz')
md5sums=('70aa42aa7bea702726078f54a32d1ed7')
sha512sums=('09388c0d0654b9be12db530a0dfd24b048247cf2026faa5a3f5a7990e3e648174397214fc4adb49332669c1cb70e6d8e305eee6ff6ff8565a8343bc6449fe8ea')
_distdir="Carp-Assert-More-2.5.0"

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
