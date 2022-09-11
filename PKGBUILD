# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: Kars Wang <jaklsy AT gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sereal-encoder'
pkgver='5.001'
pkgrel='1'
pkgdesc="Perl/CPAN Module Sereal::Encoder: Fast, compact, powerful binary serialization"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-sereal-decoder>=5.000' 'zstd>=1.5.2')
makedepends=()
checkdepends=('perl-test-deep' 'perl-test-differences' 'perl-test-longstring' 'perl-test-warn')
url='https://metacpan.org/release/Sereal-Encoder'
source=("http://search.cpan.org/CPAN/authors/id/Y/YV/YVES/Sereal-Encoder-$pkgver.tar.gz")
md5sums=('961878091711a093e82aa7b479115c2f')
sha512sums=('6325e2ff08ee583fb7be2bf394ae47a77ffd9df0952b9537e403a00f671f27775b0d139382d97f9e37078f51b79eea146f4edd1822b5a23f972ca90f0303044b')
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
