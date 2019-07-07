# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-coerce-types-standard'
pkgver='0.000005'
pkgrel='1'
pkgdesc="Coercing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moo>=2.003002' 'perl-moox-lazierattributes>=1.03' 'perl-type-tiny>=1.002001' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Coerce-Types-Standard'
source=('https://cpan.metacpan.org/authors/id/L/LN/LNATION/Coerce-Types-Standard-0.000005.tar.gz')
md5sums=('d73a48fdf48f019f0783b56acb472042')
sha512sums=('4a5dee171b48d92a0c9655036d028e446890ecceb2bf7e844a4c2ee2e1482a9e8e599450e364bb0673f8124c91975f510e1c7daaa23c535614a4c9cce76b0957')
_distdir="Coerce-Types-Standard-0.000005"

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
