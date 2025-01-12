# CPAN Name  : Compress-Raw-Lzma
# Maintainer : Leon Möller <jkhsjdhjs at totally dot rip>
# Contributor: Asger Hautop Drewsen <asgerdrewsen@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

# Generate with: cpan2dist --format CPANPLUS::Dist::Arch Compress::Raw::Lzma
# Then copy PKGBUILD from ~/.cpanplus/$cpanplus_ver/pacman/build/perl-compress-raw-lzma-$pkgver/PKGBUILD

pkgname='perl-compress-raw-lzma'
pkgver='2.213'
pkgrel='1'
pkgdesc="Low-Level Perl Interface to lzma compression library"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-pod-markdown' 'xz>=5.6.3')
makedepends=()
url='https://metacpan.org/release/Compress-Raw-Lzma'
source=('http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/Compress-Raw-Lzma-2.213.tar.gz')
md5sums=('f3bb656d9524b1d8ac4a47707dcd1f1d')
sha512sums=('7e41eaaf8a244a2e2e06f8c7b23bd88d7afd83daf44022d03f650c3990a7ffe5d39bb153fe4583711fd860e7e8e6eb19b7397fcb93d56b6df3c7f95bcdb5ad75')
_distdir="Compress-Raw-Lzma-2.213"

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
