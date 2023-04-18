# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-xml-generator'
pkgver='1.11'
pkgrel='1'
pkgdesc="Perl extension for generating XML"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/XML-Generator'
source=("https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/XML-Generator-$pkgver.tar.gz")
md5sums=('077572eebabbb1490363a421f72be150')
sha512sums=('ab9e9969442c7385b0e7e21fd7bec2b13604cdf9fe015c3634d82e543f8a63ff8d17ef085bd51b061f0cdc1d9d8016324932cd46927e9d8cd9a81b1735196d1f')
_distdir="XML-Generator-$pkgver"

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
