# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-method-signatures'
pkgver='20140224'
pkgrel='1'
pkgdesc="method and function declarations with signatures and no source filter"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-any-moose>=0.11' 'perl-const-fast>=0.006' 'perl-devel-declare>=0.006002' 'perl-lexical-sealrequirehints>=0.007' 'perl-mouse>=0.64' 'perl-ppi>=1.203' 'perl-sub-name>=0.03' 'perl')
makedepends=()
checkdepends=('perl-test-exception>=0.29' 'perl-test-warn>=0.10')
url='http://search.mcpan.org/dist/Method-Signatures'
source=('http://search.mcpan.org/CPAN/authors/id/B/BA/BAREFOOT/Method-Signatures-20140224.tar.gz')
md5sums=('c9c12d964b9d8c7bfb9bf250033458b5')
sha512sums=('52a43401ae0f30eb6f67d329e32c09064cb8b3afed5c37e5ec72c75d44e3b82fe90bd9ba4b68db46019119351b4b7e86189cc9fb7bc975af81c9036a005cbb57')
_distdir="Method-Signatures-20140224"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
