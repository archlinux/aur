# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-io-compress-lzma'
pkgver='2.214'
pkgrel='1'
pkgdesc="Write lzma files/buffers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-compress-raw-lzma>=2.214' 'perl-io-compress')
makedepends=()
url='https://metacpan.org/release/IO-Compress-Lzma'
source=('http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/IO-Compress-Lzma-2.214.tar.gz')
md5sums=('61b7d7474f22ef6f95cc7d1935b5778f')
sha512sums=('92de7947573cd711bd84d91215009fc4f032002fe84dea2ef50fb4e1e0bac62a4088cb749fdb881d6c5536f8f28e1040501022d8c07a5b22bda33d61ca5a6a74')
_distdir="IO-Compress-Lzma-2.214"

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
