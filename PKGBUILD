# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-uri-ws'
pkgver='0.03'
pkgrel='1'
pkgdesc="WebSocket support for URI package"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-uri')
makedepends=()
url='http://search.mcpan.org/dist/URI-ws'
source=('http://search.mcpan.org/CPAN/authors/id/P/PL/PLICEASE/URI-ws-0.03.tar.gz')
md5sums=('00d9aad6c4ac0234a06fd5f953cf056e')
sha512sums=('138f6605a4cf83d90a2b0b4238ee5112e8b3aa422fa9cdfc98e7d99767c1993200cd4a2487bae982c1adfd0e8574cc866249166ab64afdb2b7631ca220c0fa5a')
_distdir="URI-ws-0.03"

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
