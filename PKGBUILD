# CPAN Name  : Compress-Raw-Lzma
# Maintainer : Leon Möller <jkhsjdhjs at totally dot rip>
# Contributor: Asger Hautop Drewsen <asgerdrewsen@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-compress-raw-lzma'
pkgver='2.101'
pkgrel='1'
pkgdesc="Low-Level Interface to lzma compression library"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0' 'xz>=5.2.5')
makedepends=()
url='https://metacpan.org/release/Compress-Raw-Lzma'
source=('http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/Compress-Raw-Lzma-2.101.tar.gz')
md5sums=('7ba205e1761e0feb6a1efed0899a6b2b')
sha512sums=('abd5282f70ca9dc7933d82731e1b2d920ef7e61e3c0deba5a919f5743cf5a6330821c042cf8d637a995662ef7fa3044aeb0b877593abe19502bf4e25a5113b5e')
_distdir="Compress-Raw-Lzma-2.101"

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
