# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-perl-prereqscanner-notquitelite'
pkgver='0.9917'
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
md5sums=('e50bf6de778dee04f992734a649df556')
sha512sums=('5b6da93677e6f23fd6b6c0b76a44d516df932a4e51186f2a2336f3b2410835eab5657f30f97c40398d255ce1e279cc76f41bf87c30cf62a65141692a442e8d41')
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
