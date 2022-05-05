# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: Kars Wang <jaklsy AT gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sereal'
pkgver='4.023'
pkgrel='1'
pkgdesc="Perl/CPAN Module Sereal: Fast, compact, powerful binary (de-)serialization"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-sereal-decoder>=4.023' 'perl-sereal-encoder>=4.023')
makedepends=()
checkdepends=('perl-test-deep' 'perl-test-differences' 'perl-test-longstring' 'perl-test-warn')
url='https://metacpan.org/release/Sereal'
source=("http://search.cpan.org/CPAN/authors/id/Y/YV/YVES/Sereal-$pkgver.tar.gz")
md5sums=('d2035ee08fe7a806c89c988b9bbc3487')
sha512sums=('849cda34555e6d3cf428576be83e374e39a4a9e310da853aabac27acc2c4be81f4cf1da4f3513f975d3e6acd3eef5dcb8f8297926c903d7d21e1b7b3fccbf9ba')
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
