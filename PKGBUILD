# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-class-field'
pkgver='0.24'
pkgrel='1'
pkgdesc="Class Field Accessor Generator"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/Class-Field'
source=('https://cpan.metacpan.org/authors/id/I/IN/INGY/Class-Field-0.24.tar.gz')
md5sums=('db368d2796c4f97de48c671af7d3f9d8')
sha512sums=('4956190f6f1e6d6714a823421adf6c74ab1c884d059efad9ada5d8671d45ca4766c9ca9253a50784802ee0997fd5aa5dc870b16eb3e804564930e8fc68788472')
_distdir="Class-Field-0.24"

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
