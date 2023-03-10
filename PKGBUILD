# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-app-cpanminus'
pkgver='1.7046'
pkgrel='1'
pkgdesc="get, unpack, build and install modules from CPAN"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/App-cpanminus'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/App-cpanminus-1.7046.tar.gz')
md5sums=('c6630373e444ed1e6b772e50e526a333')
sha512sums=('ced5f264979eb50cc33ac566c0242998c9b9c158ba435b9a180810f58eaa0b28d0de70312ade10df0ee3808369423f7baa029f2be740461d20a695e5e24d0d9b')
_distdir="App-cpanminus-1.7046"

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
