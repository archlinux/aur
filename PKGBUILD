# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-parse-errorstring-perl'
pkgver='0.27'
pkgrel='3'
pkgdesc="Parse error messages from the perl interpreter"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-class-xsaccessor>=0' 'perl-pod-pom>=0.27' 'perl-pod-parser>=0' 'perl>=5.8.7')
makedepends=()
checkdepends=('perl-test-differences>=0')
url='https://metacpan.org/release/Parse-ErrorString-Perl'
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MANWAR/Parse-ErrorString-Perl-$pkgver.tar.gz")
md5sums=('5e08c15773fde8e8f519a0fc4643e474')
sha512sums=('2111d3d130e7eeb754e11d6a20cd289be888fd384853d19000820363b8a2bb60f75db029cbf6646ec267ba5a9f25ddc596c335c41623cc07a82b12fce81a9800')
_distdir="Parse-ErrorString-Perl-$pkgver"

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
