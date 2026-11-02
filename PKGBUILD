# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-punk'
pkgver='0.68'
pkgrel='1'
pkgdesc="a MVC web framework"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-apophis>=0.05' 'perl-dbix-loop>=0.07' 'perl-fetch>=0.12' 'perl-file-raw>=0.18' 'perl-file-raw-json>=0.06' 'perl-file-raw-xml>=0.03' 'perl-frozen>=0.08' 'perl-hyperman>=0.64' 'perl-json-schema-fast>=0.05' 'perl-markdown-simple>=0.21' 'perl-open-api>=0.14' 'perl-search-trigram>=0.03' 'perl-template-stencil>=0.10' 'perl-yaml-libyaml>=0' 'perl>=5.10.0')
makedepends=()
url='https://metacpan.org/release/Punk'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/Punk-$pkgver.tar.gz")
md5sums=('3a9bb22d2573ededdb573a9fcbcc1d59')
sha512sums=('36c56627cb772ad9dccb560f30d5bb5005a3630a9aff91b9ffd5c68572fda6505b10170d42f06cc5225df79faee0290cd2658ffed764b45cc511c36a0970a0f0')
_distdir="Punk-$pkgver"

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
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
