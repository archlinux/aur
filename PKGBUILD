# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: Kars Wang <jaklsy AT gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sereal-encoder'
pkgver='5.004'
pkgrel='1'
pkgdesc="Perl/CPAN Module Sereal::Encoder: Fast, compact, powerful binary serialization"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-sereal-decoder>=5.004' 'zstd>=1.5.5')
makedepends=()
checkdepends=('perl-test-deep' 'perl-test-differences' 'perl-test-longstring' 'perl-test-warn')
url='https://metacpan.org/release/Sereal-Encoder'
source=("http://search.cpan.org/CPAN/authors/id/Y/YV/YVES/Sereal-Encoder-$pkgver.tar.gz")
md5sums=('893cb6672cee5505b897f3361487c158')
sha512sums=('6ad25a4a3cdc3e7de7b7f47b7511154b5e6eca90a54b305a8d50f59dd1352000f054255912c4eeb6d37991813844068b1a0e2f544be27ac9bcea08fb6c0fc6d5')
_distdir="Sereal-Encoder-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
