# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moox-returnmodifiers'
pkgver='1.000002'
pkgrel='2'
pkgdesc="Returns Moo Modifiers as a Hash"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-moo>=1.001001' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/MooX-ReturnModifiers'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/MooX-ReturnModifiers-$pkgver.tar.gz")
md5sums=('99e994e20a47bf3ace6494b3730fbeae')
sha512sums=('5d95f976f24632f73dabbfda67868db52d9ff7587e5af6a4f19f0e08954197e31e86896409ca6e814df6411dee90811f0c781e126023e5c2f11e85e8ce1c1434')
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
