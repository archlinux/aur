# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-bioperl'
pkgver='1.7.7'
pkgrel='1'
pkgdesc="Perl modules for biology"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-stag>=0' 'perl-error>=0' 'perl-graph>=0' 'perl-http-message>=0' 'perl-io-string>=0' 'perl-io-stringy>=0' 'perl-ipc-run>=0' 'perl-list-moreutils>=0' 'perl-module-build>=0' 'perl-set-scalar>=0' 'perl-uri>=0' 'perl-xml-dom>=0' 'perl-xml-dom-xpath>=0' 'perl-xml-libxml>=0' 'perl-xml-sax>=0' 'perl-xml-sax-base>=0' 'perl-xml-sax-writer>=0' 'perl-xml-twig>=0' 'perl-xml-writer>=0' 'perl-yaml>=0' 'perl-libwww>=0' 'libxml-perl>=0' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-memory-cycle>=0' 'perl-test-most>=0' 'perl-test-requiresinternet>=0' 'perl-test-weaken>=0')
url='https://metacpan.org/release/BioPerl'
source=('https://cpan.metacpan.org/authors/id/C/CJ/CJFIELDS/BioPerl-1.7.7.tar.gz')
md5sums=('6618f1f826fb17fec04cd3f957542393')
sha512sums=('adcb04b5aa8af2c15edd85b057842ba5f2f8c269a2c9d1b65b96c265539e49b0bb27901d687ec7382cf96c07c576e95c50a32caddf9286eb19c9591a56a12c82')
_distdir="BioPerl-1.7.7"

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
