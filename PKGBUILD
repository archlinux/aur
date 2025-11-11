# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-io-async'
pkgver='0.804'
pkgrel='1'
pkgdesc="Asynchronous event-driven programming"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-future>=0.44' 'perl-struct-dumb>=0' 'perl>=5.014')
makedepends=('perl-module-build>=0.4004')
checkdepends=('perl-test-future-io-impl>=0' 'perl-test-metrics-any>=0')
url='https://metacpan.org/release/IO-Async'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/IO-Async-0.804.tar.gz')
md5sums=('3a4a448e3bbefb66b524de0ce2309777')
sha512sums=('294cac4ef904a3e2bf55d7852a64c2e8006dd2120edce2ee8158c55dfb52b018e48403178a031e00febb79f5ae8590a007020a913eac42b76042672ba89ddf07')
_distdir="IO-Async-0.804"

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
