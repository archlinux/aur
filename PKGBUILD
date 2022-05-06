# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-http'
pkgver='0.19'
pkgrel='1'
pkgdesc="Testing for HTTP services"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-field>=0' 'perl-libwww>=0')
makedepends=()
url='https://metacpan.org/release/Test-HTTP'
source=("https://cpan.metacpan.org/authors/id/M/MM/MML/Test-HTTP-$pkgver.tar.gz")
md5sums=('94fcc4f658eaea030f7820d91a53aaeb')
sha512sums=('7fe9835e700e60414a35998baff7a792e7288ba8d0381a882a846d4bd799b8533064edcf2b8eb366141b0c8b7771508572d51d3663b62e2f24011bc8a661f666')
_distdir="Test-HTTP-$pkgver"

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
