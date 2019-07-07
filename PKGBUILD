# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moox-returnmodifiers'
pkgver='1.000000'
pkgrel='1'
pkgdesc="Returns Moo Modifiers as a Hash"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moo>=1.001001' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/MooX-ReturnModifiers'
source=('https://cpan.metacpan.org/authors/id/L/LN/LNATION/MooX-ReturnModifiers-1.000000.tar.gz')
md5sums=('f63abb7fcc2122af1bc7733093284bc0')
sha512sums=('adf825e6121af6420f30c5aa327ea30b2ff32a7b6075ef249eae7eb408b070fead4708931e90dcd41cc1d1d3533919f33385830a14c1dc4892b8ac99859fe396')
_distdir="MooX-ReturnModifiers-1.000000"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
