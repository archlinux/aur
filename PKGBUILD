# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-json-rpc2'
pkgver='2.1.1'
pkgrel='1'
pkgdesc="Transport-independent implementation of JSON-RPC 2.0"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json-maybexs' 'perl>=5.10.1')
makedepends=()
checkdepends=('perl-test-exception')
url='https://metacpan.org/release/JSON-RPC2'
source=('http://search.cpan.org/CPAN/authors/id/P/PO/POWERMAN/JSON-RPC2-v2.1.1.tar.gz')
md5sums=('b4831f6cbcf8a482cabd99423164dc6c')
sha512sums=('1f977db60549cd19bf7d2b3f44b47476624f44d8fdd8d52833234c3b6772b1721e1b82a01f86f336a74b7262f58f12f972ebdad68a31f984b368e7b7f6a3096b')
_distdir="JSON-RPC2-v2.1.1"

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
