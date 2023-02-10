# CPAN Name  : Compress-Raw-Lzma
# Maintainer : Leon Möller <jkhsjdhjs at totally dot rip>
# Contributor: Asger Hautop Drewsen <asgerdrewsen@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-compress-raw-lzma'
pkgver='2.204'
pkgrel='1'
pkgdesc="Low-Level Interface to lzma compression library"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0' 'xz>=5.4.1')
makedepends=()
url='https://metacpan.org/release/Compress-Raw-Lzma'
source=('http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/Compress-Raw-Lzma-2.201.tar.gz')
md5sums=('366a7fbb946cd2be6a60e69123b62f5e')
sha512sums=('df43f8ab1550a3522fde74da07c18b095155bd58b2797bf5408253489de70843768db925d27ba183f8c19170d780b69c1949ccfd4e2d83e0a740e834034ce360')
_distdir="Compress-Raw-Lzma-2.201"

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
