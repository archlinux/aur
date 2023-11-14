# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-base36'
pkgver='0.14'
pkgrel='1'
pkgdesc="Encoding and decoding of base36 strings"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.0')
makedepends=()
checkdepends=('perl-test-exception>=0')
url='https://metacpan.org/release/Math-Base36'
source=('http://search.cpan.org/CPAN/authors/id/B/BR/BRICAS/Math-Base36-0.14.tar.gz')
md5sums=('cb08eb9dcf4f00a5ac7b91863ca602e5')
sha512sums=('d851ec86bf4d561d8f1c8b46de3dfd5108943d3d260296e0fddebf3e5ff6b069765260ae20af6ef5741c4677feb9a9ae588457197d44f57bb9434b64cd268e59')
_distdir="Math-Base36-0.14"

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
