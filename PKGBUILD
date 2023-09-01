# CPAN Name  : Compress-Raw-Lzma
# Maintainer : Leon Möller <jkhsjdhjs at totally dot rip>
# Contributor: Asger Hautop Drewsen <asgerdrewsen@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

# Generate with: cpan2dist --format CPANPLUS::Dist::Arch Compress::Raw::Lzma
# Then copy PKGBUILD from ~/.cpanplus/$cpanplus_ver/pacman/build/perl-compress-raw-lzma-$pkgver/PKGBUILD

pkgname='perl-compress-raw-lzma'
pkgver='2.206'
pkgrel='1'
pkgdesc="Low-Level Interface to lzma compression library"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0' 'xz>=5.4.4')
makedepends=()
url='https://metacpan.org/release/Compress-Raw-Lzma'
source=('http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/Compress-Raw-Lzma-2.206.tar.gz')
md5sums=('ad272c69a41d03f7e47f51dca599ab20')
sha512sums=('fdffd579a2c0b76ef6dc1f6dd82f9332a52fc8963eff07a1ed92324248ea253d220a6e01e3b7ed93d072d4f83dad739f58229480dcc984c7a0246c5e966b89f0')
_distdir="Compress-Raw-Lzma-2.206"

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
