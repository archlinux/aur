# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-perl-prereqscanner-notquitelite'
pkgver='0.9916'
pkgrel='1'
pkgdesc="a tool to scan your Perl code for its prerequisites"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-dump>=0' 'perl-module-cpanfile>=1.1004' 'perl-module-find>=0' 'perl-regexp-trie>=0' 'perl-uri-cpan>=0' 'perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-failwarnings>=0' 'perl-test-useallmodules>=0.17' 'perl-extutils-makemaker-cpanfile' 'perl-parse-distname')
url='https://metacpan.org/release/Perl-PrereqScanner-NotQuiteLite'
source=("http://search.cpan.org/CPAN/authors/id/I/IS/ISHIGAKI/Perl-PrereqScanner-NotQuiteLite-${pkgver}.tar.gz")
md5sums=('134f57865a35c441c5c2a27a077e4a11')
sha512sums=('bea54a78a4095a705eb6aa9a1fc6d2ab4960eb78fbff88300a17fed21d90da156e83b1511710739c098e462c7219ee22f12d2061fdc8efc175bdd3377640add4')
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
