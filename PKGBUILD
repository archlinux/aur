# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-coerce-types-standard'
pkgver='0.000009'
pkgrel=2
pkgdesc="Coercing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moo>=2.003002' 'perl-moox-lazierattributes>=1.03' 'perl-type-tiny>=1.002001' 'perl>=5.006')
makedepends=()
checkdepends=('perl-json')
url='https://metacpan.org/release/Coerce-Types-Standard'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/Coerce-Types-Standard-$pkgver.tar.gz")
md5sums=('42aa1546d1e20f26e8e02f1aae60bde2')
sha512sums=('b54e32945366a5af9a14c9037ac3648547c04a541b5f14cf036a4dfb900419972e53ada3282928b4acd26fc6b49e452f8dda642d68cc199cfff58b1288c8dce1')
_distdir="Coerce-Types-Standard-$pkgver"

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
