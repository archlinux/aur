# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-io-compress-lzma'
pkgver='2.206'
pkgrel='1'
pkgdesc="Write lzma files/buffers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-compress-raw-lzma>=2.206' 'perl-io-compress>=0')
makedepends=()
url='https://metacpan.org/release/IO-Compress-Lzma'
source=('http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/IO-Compress-Lzma-2.206.tar.gz')
md5sums=('8f484d7a8fce2cde3379f3c210ad06b5')
sha512sums=('f0f1f5ab3ba03b08d8905dcd166fe7591bc955517f42b20300a709dd5cec2f7db9cd7bec3547df95124772879eb6349b810a52f25b351eff4f626026a6e8e043')
_distdir="IO-Compress-Lzma-2.206"

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
