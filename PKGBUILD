# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: Kars Wang <jaklsy AT gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sereal'
pkgver='4.005'
pkgrel='1'
pkgdesc="Fast, compact, powerful binary (de-)serialization"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-sereal-decoder>=4.005' 'perl-sereal-encoder>=4.005')
makedepends=()
checkdepends=('perl-test-longstring' 'perl-test-warn')
url='https://metacpan.org/release/Sereal'
source=("http://search.cpan.org/CPAN/authors/id/Y/YV/YVES/Sereal-$pkgver.tar.gz")
md5sums=('3c86a66a39ca9fac638478a7206b22ae')
sha512sums=('89dd27ca0642141f0a14aaea5e1c78cd02602584a1cbccb7cf808a6a8b4ad51d090049b5e4db55ddd9e32f91c40bca231a82b9d5c89a69a47e7b24a9b79a6ef8')
_distdir="Sereal-$pkgver"

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
