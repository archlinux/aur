# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-carp-assert-more'
pkgver='2.4.0'
pkgrel='1'
pkgdesc="unknown"
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl-test-exception>=0' 'perl>=5.10.1')
makedepends=()
url='https://metacpan.org/release/Carp-Assert-More'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/Carp-Assert-More-2.4.0.tar.gz')
md5sums=('a964a40442b4b1d27debb624fe810a64')
sha512sums=('a23450b10eb8402d928903fafa4538130c740fc0b2f71534e252ffd6442d5b1da6e297f41cdb797df19978d5d54f0bfc4ebc89de95d8706a1c841512525bad7b')
_distdir="Carp-Assert-More-2.4.0"

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
