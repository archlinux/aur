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
source=('http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/Compress-Raw-Lzma-2.204.tar.gz')
md5sums=('d8aa6ba58eb64f9e0b4eef05783d388c')
sha512sums=('7f5f6f6fc4012a1ee94ef87c198da10489ab10ce92e14ddce63e3eb9a590f22870d82028b0e97d785921ad48d06328b508cc983d19eafe2b6274eba7087deffa')
_distdir="Compress-Raw-Lzma-2.204"

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
