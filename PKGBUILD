# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-acme-travigator'
pkgver='0.005'
pkgrel='1'
pkgdesc="who needs google when you have the travigator"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Acme-Travigator'
source=('http://search.mcpan.org/CPAN/authors/id/M/MD/MDMONSEN/Acme-Travigator-0.005.tar.gz')
md5sums=('ba35d8f40410f8ccc2c57f46d1c1b1fa')
sha512sums=('3ac04df83a7a9c439dff6bc4aa459023559747221c7ca9edb936f125315242b55b1ec66e9655a7f5da4a58dbe882e688bf145f34108b8fdacb2bdc557b699356')
_distdir="Acme-Travigator-0.005"

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
