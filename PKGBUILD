# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-perl-prereqscanner-notquitelite'
pkgver='0.9913'
pkgrel='1'
pkgdesc="a tool to scan your Perl code for its prerequisites"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-dump>=0' 'perl-module-cpanfile>=1.1004' 'perl-module-find>=0' 'perl-regexp-trie>=0' 'perl-uri-cpan>=0' 'perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-failwarnings>=0' 'perl-test-useallmodules>=0.17' 'perl-extutils-makemaker-cpanfile')
url='https://metacpan.org/release/Perl-PrereqScanner-NotQuiteLite'
source=("http://search.cpan.org/CPAN/authors/id/I/IS/ISHIGAKI/Perl-PrereqScanner-NotQuiteLite-${pkgver}.tar.gz")
md5sums=('6fd6e16c64317afae6df485621780aea')
sha512sums=('a84517ec1724bade584b873ccd5cc61beb9673dd240e849f58e499c63079ca7f086e8191a5875f27bd725d3a0081a1674fd36bc30fcf8e17d2abd09fd62b589c')
_distdir="Perl-PrereqScanner-NotQuiteLite-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
