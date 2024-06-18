# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-io-async'
pkgver='0.803'
pkgrel='1'
pkgdesc="Asynchronous event-driven programming"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-future>=0.44' 'perl-struct-dumb>=0' 'perl>=5.014')
makedepends=('perl-module-build>=0.4004')
checkdepends=('perl-test-future-io-impl>=0' 'perl-test-metrics-any>=0' 'perl-test2-suite>=0')
url='https://metacpan.org/release/IO-Async'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/IO-Async-0.803.tar.gz')
md5sums=('bc6d39ca30f71db157b29f8211f57dc3')
sha512sums=('62499b1f0046d5917f9764d00cf1caa97af88d8abd46d4ba6d8c845ede490e93a38492b0c2974d0fbd4cb55234c9781be18a9c56338c28ea351a3a6e02d97f0e')
_distdir="IO-Async-0.803"

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
