# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-io-aio'
pkgver='4.76'
pkgrel='1'
pkgdesc="Asynchronous/Advanced Input/Output"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.33' 'perl-common-sense>=0')
makedepends=('perl-canary-stability')
url='https://metacpan.org/release/IO-AIO'
source=("http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/IO-AIO-${pkgver}.tar.gz")
md5sums=('e297226cde0ae19c936ab0aaaa3930d9')
sha512sums=('013c8e7e8501ca4f42b46102f3713bae580e6f05a416a2e77176e67c6c41ed6f71d35a4894132a9a7510d84799d9337820824020624eef709e5f378e90a063ee')
_distdir="IO-AIO-${pkgver}"

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
