# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-perl-prereqscanner-notquitelite'
pkgver='0.9918'
pkgrel=1
pkgdesc="a tool to scan your Perl code for its prerequisites"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-data-dump>=0' 'perl-module-cpanfile>=1.1004' 'perl-module-find>=0' 'perl-regexp-trie>=0' 'perl-uri-cpan>=0' 'perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-failwarnings>=0' 'perl-test-useallmodules>=0.17' 'perl-extutils-makemaker-cpanfile' 'perl-parse-distname')
url='https://metacpan.org/release/Perl-PrereqScanner-NotQuiteLite'
source=("http://search.cpan.org/CPAN/authors/id/I/IS/ISHIGAKI/Perl-PrereqScanner-NotQuiteLite-${pkgver}.tar.gz")
md5sums=('5d65dbdd53b29c2a538a38f4484c39c4')
sha512sums=('474b04787a973a4a5b73924f2a49027fd61f5989ec196399319146af33e66f6ff40bf357902ac4b172fb1c724f7d851fa637d214fad2671e0eb70d8300229f4c')
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
