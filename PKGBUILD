# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: Kars Wang <jaklsy AT gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sereal'
pkgver='5.004'
pkgrel='1'
pkgdesc="Perl/CPAN Module Sereal: Fast, compact, powerful binary (de-)serialization"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-sereal-decoder>=5.004' 'perl-sereal-encoder>=5.004')
makedepends=()
checkdepends=('perl-test-deep' 'perl-test-differences' 'perl-test-longstring' 'perl-test-warn')
url='https://metacpan.org/release/Sereal'
source=("http://search.cpan.org/CPAN/authors/id/Y/YV/YVES/Sereal-$pkgver.tar.gz")
md5sums=('80e93f49fa5df91bfd4adc94b90e5b37')
sha512sums=('08107b12ea4fd5a7ae447df25a6bcd2e5a4d6ce7c13b6a51fe2b6c9a0862275ad1959d866a1b32fca2f4f6582dae7c2c81790552c204f3d41b9e2d63ddda1a7b')
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
