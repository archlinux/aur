# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-io-zlib'
pkgver='1.14'
pkgrel='1'
pkgdesc="IO:: style interface to Compress::Zlib"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/IO-Zlib'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOMHUGHES/IO-Zlib-1.14.tar.gz')
md5sums=('e628c00af8459d931b47a734b082e2aa')
sha512sums=('b638be7f4be266035a029ea6553b782f8bb6e3876e371cebeab60c975b3faca722d20c90e58167dcdae77fb0329271fbf45aa225e79ad45934735b3017e33237')
_distdir="IO-Zlib-1.14"

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
