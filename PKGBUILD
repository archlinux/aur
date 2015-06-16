# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-json-rpc2'
pkgver='1.0.0'
pkgrel='1'
pkgdesc="Transport-independent implementation of json-rpc 2.0"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json-xs')
makedepends=()
checkdepends=('perl-test-exception')
url='http://search.mcpan.org/dist/JSON-RPC2'
source=('http://search.mcpan.org/CPAN/authors/id/P/PO/POWERMAN/JSON-RPC2-1.0.0.tar.gz')
md5sums=('cc009e17eb348a051c3f2de5c3c1668d')
sha512sums=('d212bbe81023ac652ffeb41aacafdb58579b3a8289486fa7e0a68dd18dfaa3bc544e72a4557fbffb516915970b995caa225f29d663e7e9a7391a591387f53e47')
_distdir="JSON-RPC2-1.0.0"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
