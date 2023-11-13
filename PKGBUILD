# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moox-returnmodifiers'
pkgver='1.000001'
pkgrel='1'
pkgdesc="Returns Moo Modifiers as a Hash"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moo>=1.001001' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/MooX-ReturnModifiers'
source=("https://cpan.metacpan.org/authors/id/L/LN/LNATION/MooX-ReturnModifiers-$pkgver.tar.gz")
md5sums=('f65d203c73549c915f6fbbb73170fd4d')
sha512sums=('850a4b5e85390478f0a1a3ac6712d044ec0a73343cd18ba13a9e0d5b19ff7a9367543489a6468d28ae4fd3daae3c1f658db533982c5bf1b0419dd54cc0431e65')
_distdir="MooX-ReturnModifiers-$pkgver"

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
