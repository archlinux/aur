# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-compress-raw-lzma'
pkgver='2.074'
pkgrel='1'
pkgdesc="Low-Level Interface to lzma compression library"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0' 'xz>=5.2.3')
makedepends=()
url='https://metacpan.org/release/Compress-Raw-Lzma'
source=('http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/Compress-Raw-Lzma-2.074.tar.gz')
md5sums=('885aa6aea9cc5f4ace4effc882db278f')
sha512sums=('2ece1511670e9840d0840f36e9ec79c439bdfa6837be538b6e2461d4d6667470cd9276b71378c27707bca79f1e401e5e9da35204a8531ef361856844c65f7dc4')
_distdir="Compress-Raw-Lzma-2.074"

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
