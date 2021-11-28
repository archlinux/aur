# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-perl-prereqscanner-notquitelite'
pkgver='0.9914'
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
md5sums=('d91a40a81b779e3b3cad93964bad8da1')
sha512sums=('7c146320119996cb1fa590ca578ad00cb05b67dd28657a68910a9fa608bf125005e5d4bafd5cef8622d7f8a6f6a2e55b50eb030086cc00d5fff1ed98bc441aed')
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
