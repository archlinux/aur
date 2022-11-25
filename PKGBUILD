# Maintainer: éclairevoyant
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-metrics-any'
pkgver=0.01
pkgrel=1
pkgdesc="assert that code produces metrics via Metrics::Any"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-metrics-any>=0')
makedepends=('perl-module-build')
checkdepends=('perl-test-pod')
url='https://metacpan.org/release/Test-Metrics-Any'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/Test-Metrics-Any-0.01.tar.gz')
sha512sums=('7102a8bf5c38bb186c648e2544a01914605e7d5e88ef8a848c301f39eca94af1823b2b40889bc9aabb4fd94573191896e2726f495a7ff03b9ab241d81cd4f304')
_distdir="Test-Metrics-Any-0.01"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
