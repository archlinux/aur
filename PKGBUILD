# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: Kars Wang <jaklsy AT gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sereal-decoder'
pkgver='4.005'
pkgrel='1'
pkgdesc="Perl/CPAN Module Sereal::Decoder: Fast, compact, powerful binary deserialization"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'zstd>=1.3.3')
makedepends=()
checkdepends=('perl-test-deep' 'perl-test-differences' 'perl-test-longstring' 'perl-test-warn')
url='https://metacpan.org/release/Sereal-Decoder'
source=("http://search.cpan.org/CPAN/authors/id/Y/YV/YVES/Sereal-Decoder-$pkgver.tar.gz")
md5sums=('68a7a2220cc9d05585100e4eace9da9f')
sha512sums=('0ff4289d93af21e597ad0a1208fc4ed3e02090f3d61dadd2cfa329d9cc60938eb458ab7c33582224883db99db65d3e38c21273bd4195fd69edaf26f9658a8f97')
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
