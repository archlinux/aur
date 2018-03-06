# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-io-compress-lzma'
pkgver='2.074'
pkgrel='1'
pkgdesc="Write lzma files/buffers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-compress-raw-lzma>=2.074')
makedepends=()
url='https://metacpan.org/release/IO-Compress-Lzma'
source=('http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/IO-Compress-Lzma-2.074.tar.gz')
md5sums=('80104c11b210eb0ea38422db6636e07f')
sha512sums=('b730a7bb2b31c8be421befe7db90bd40993abe89da2de546774fd5fb4c279aadf9b5555b6055f2bda29cee84b940902cfc8ca937b8259f95335faed028e2443a')
_distdir="IO-Compress-Lzma-2.074"

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
