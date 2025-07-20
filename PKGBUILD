# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moox-strictconstructor'
pkgver='0.013'
pkgrel='2'
pkgdesc="Make your Moo-based object constructors blow up on unknown attributes"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-moo>=2.004000' 'perl>=5.008')
makedepends=()
checkdepends=('perl-test-fatal>=0')
url='https://metacpan.org/release/MooX-StrictConstructor'
source=("http://search.cpan.org/CPAN/authors/id/H/HA/HAARG/MooX-StrictConstructor-$pkgver.tar.gz")
md5sums=('355d918750e697481030baa1a2cf3943')
sha512sums=('97476a32b55a929996ec9fd663c3e8008eb73765019085da8f396c8ec5128e8bca6dfb91f85f6cf4bade2faff754290a791d503940850a39d55501b6f9b5651b')
_distdir="MooX-StrictConstructor-$pkgver"

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
