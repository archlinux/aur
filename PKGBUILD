# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-data-temporarybag'
pkgver='0.09'
pkgrel='1'
pkgdesc="Handle long size data using temporary file ."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Data-TemporaryBag'
source=('http://search.cpan.org/CPAN/authors/id/Y/YS/YSAS/Data-TemporaryBag-0.09.tar.gz')
md5sums=('a0045c0cc1fe92dd54ead9a682a83f08')
sha512sums=('255a2dad0ad829dd499e62d8b2382d4f3297e1f494b384aa36bbfbc50ac165436814d83507d74e0eb81d15ebe1567d4e4dcbd5d9484db054a087857c6c1d5807')
_distdir="Data-TemporaryBag-0.09"

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
