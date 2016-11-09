# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-term-twiddle'
pkgver='2.73'
pkgrel='2'
pkgdesc="Twiddles a thingy while-u-wait"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Term-Twiddle'
source=('http://search.cpan.org/CPAN/authors/id/S/SC/SCOTTW/Term-Twiddle-2.73.tar.gz')
md5sums=('e5d31c85374f66b939f3cb6716604873')
sha512sums=('bdc5bfa00fe1f81de25b2469f143aa1541028ed45fc2d637dcf91f7d6d9437ac38d5e393ad08c2552bda8f6839109dc613673c510a94ba64044f92346abf1611')
_distdir="Term-Twiddle-2.73"

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

# skip checks: most of them are interacive.
#check() {
#  cd "$srcdir/$_distdir"
#  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
#    make test
#  )
#}

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
