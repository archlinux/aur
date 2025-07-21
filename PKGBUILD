# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-xml-generator'
pkgver='1.13'
pkgrel='2'
pkgdesc="Perl extension for generating XML"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl>=5.010')
makedepends=()
url='https://metacpan.org/release/XML-Generator'
source=("http://search.cpan.org/CPAN/authors/id/T/TI/TIMLEGGE/XML-Generator-$pkgver.tar.gz")
md5sums=('1ad1050f0003df591613a38f705f3fba')
sha512sums=('ae2b09633a7d9d1bf6cc3ca8c19532585e69534f865e712969cff50d60d1e05589dfbfae6a5ecdb59ef68fbb127431744bf09b0bf91a1c86a9853c596667d248')
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
