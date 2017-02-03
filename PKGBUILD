# Maintainer: Elliott "Seylerius" Seyler <seylerius@publicinquisition.com>
# Generator : CPANPLUS::Dist::Arch 1.32

pkgname='perl-net-websocket-server'
pkgver='0.003004'
pkgrel='1'
pkgdesc="A straightforward Perl WebSocket server with minimal dependencies. "
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-protocol-websocket>=0.12' 'perl>=5.006' 'perl-yaml')
makedepends=()
url='https://metacpan.org/release/Net-WebSocket-Server'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOPAZ/Net-WebSocket-Server-0.003004.tar.gz')
md5sums=('0625548472d30554d1ea24c4fa61fe38')
sha512sums=('06ef525b8051a9ec65b0a7def2627f11d29a9a3177e90519754e0aea24f60aa5383a434ddacb6cfdeb65b70c3184e7fb1833aa619f0553fdb76b1e3530c3a3f2')
_distdir="Net-WebSocket-Server-0.003004"

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
