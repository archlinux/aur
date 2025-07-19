# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-size'
pkgver='0.85'
pkgrel='2'
pkgdesc="Perl extension for finding the memory usage of Perl variables"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl>=5.005')
makedepends=()
url='https://metacpan.org/release/Devel-Size'
source=("http://search.cpan.org/CPAN/authors/id/N/NW/NWCLARK/Devel-Size-$pkgver.tar.gz")
md5sums=('1a7023c3c595a50443f9201a3081a0eb')
sha512sums=('61507e45850c4fc7f8aea2689801324d1402e1e6aa9ea63495371c1c051e7fea393740ce7420dc6a439d45196a32662a71957685d1b60f0208808543fc6d8b88')
_distdir="Devel-Size-$pkgver"

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
