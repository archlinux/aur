# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-method-delegation'
pkgver='0.03'
pkgrel='2'
pkgdesc="Easily delegate methods to another object"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-sub-install>=0.928')
makedepends=()
checkdepends=('perl-test-most>=0.35')
url='https://metacpan.org/release/Method-Delegation'
source=("http://search.cpan.org/CPAN/authors/id/O/OV/OVID/Method-Delegation-$pkgver.tar.gz")
md5sums=('6108da3e4090620d4416d836994ed5c0')
sha512sums=('c3e54f4a880de4c7d176c7f63fe8003b869ef9418426f5433802f0c717db0cffbab17bb41e2c38984aeff3ee049867b671f47369e1acff5ef680e6716cb84fee')
_distdir="Method-Delegation-$pkgver"

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
