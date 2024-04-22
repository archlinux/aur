# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-library-callnumber-lc'
pkgver='0.23'
pkgrel='1'
pkgdesc="Deal with Library-of-Congress call numbers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=('perl-module-build>=0.38')
url='https://metacpan.org/release/Library-CallNumber-LC'
source=('http://search.cpan.org/CPAN/authors/id/D/DB/DBWELLS/Library-CallNumber-LC-0.23.tar.gz')
md5sums=('9b077cc9fc75f7142cd3f78ad91bb000')
sha512sums=('f266149b829208dc95a0a7367e11a91f3925ba959b511a0fe0818d52371096350a5d663c5499c8a2df6cced5b82de4c3a968623fa9dab0ec72e09f3e4c1501b4')
_distdir="Library-CallNumber-LC-0.23"

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
