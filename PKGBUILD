# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: Kars Wang <jaklsy AT gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sereal-encoder'
pkgver='3.015'
pkgrel='1'
pkgdesc="Fast, compact, powerful binary serialization"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-sereal-decoder>=3.00' 'perl>=5.008')
makedepends=()
checkdepends=('perl-test-longstring' 'perl-test-warn')
url='https://metacpan.org/release/Sereal-Encoder'
source=("http://search.cpan.org/CPAN/authors/id/Y/YV/YVES/Sereal-Encoder-$pkgver.tar.gz")
md5sums=('78428860e055561e371e3292093c1fc5')
sha512sums=('82dc43be1f1ec87fb4a582a4cac8bfe5b4e6e8f25645930e2f84c4b253904cf3390e36efdf744781d9211d0e73034da82f5cff131213be6ea20fdfa11a0b397c')
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
