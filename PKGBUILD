# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-carp-assert-more'
pkgver='2.3.0'
pkgrel='1'
pkgdesc="unknown"
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl-test-exception>=0' 'perl>=5.10.1')
makedepends=()
url='https://metacpan.org/release/Carp-Assert-More'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/Carp-Assert-More-2.3.0.tar.gz')
md5sums=('f10ce02f0b15caa6d7b1e34a967578d2')
sha512sums=('ba0da716230e17d6711698c5909a096df992aacaf64e5dd9ea12795ecb4c86e66e71d6967bd0fdbfb20f202e5fd0e582befb3145f52f89af09a681263046354d')
_distdir="Carp-Assert-More-2.3.0"

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
