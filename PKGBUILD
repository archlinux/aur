# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-carp-assert-more'
pkgver='2.8.0'
pkgrel='1'
pkgdesc="Convenience assertions for common situations"
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl>=5.10.1')
makedepends=()
checkdepends=('perl-test-exception>=0')
url='https://metacpan.org/release/Carp-Assert-More'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/Carp-Assert-More-2.8.0.tar.gz')
md5sums=('510b66dc482d1af7216934df77aff17d')
sha512sums=('7d899cb3f2e2a5179885f7e480656c0a20470aa814f27033e902badf4219f2bb3813db013879b2504bd4b0b2a1db15031ca01f3c1f0e5a754797d12021ebc3dd')
_distdir="Carp-Assert-More-2.8.0"

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
