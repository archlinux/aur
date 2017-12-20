# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: Kars Wang <jaklsy AT gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sereal-decoder'
pkgver='3.015'
pkgrel='1'
pkgdesc="Fast, compact, powerful binary deserialization"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008')
makedepends=()
checkdepends=('perl-test-longstring' 'perl-test-warn')
url='https://metacpan.org/release/Sereal-Decoder'
source=("http://search.cpan.org/CPAN/authors/id/Y/YV/YVES/Sereal-Decoder-$pkgver.tar.gz")
md5sums=('de91784e359e25aee07f87a8b9b2f90b')
sha512sums=('65582a86ff40d02e350bfe759cfda12c3a541c012c55c2a9bfee6cc6df5facbe8088188cb7306685d4b9ab549e8900a7bd599b207325fec7d30d90de3b68c79e')
_distdir="Sereal-Decoder-$pkgver"

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
