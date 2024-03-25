# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-log-ger'
pkgver='0.042'
pkgrel='1'
pkgdesc="A lightweight, flexible logging framework"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Log-ger'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PERLANCAR/Log-ger-0.042.tar.gz')
md5sums=('fe0c723f497d76c9335bd2aa78024a19')
sha512sums=('8fc0bc5615c8607b210c2f407dd6affdbbe9e292e37c73296d098b7698e7fea5084e04b360aa901684d5612eb00824b719349958c8c89121eea9c401d924b260')
_distdir="Log-ger-0.042"

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
