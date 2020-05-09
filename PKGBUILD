# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-http-server-brick'
pkgver='0.1.7'
pkgrel='1'
pkgdesc="Simple pure perl http/https server for prototyping \"in the style of\" Ruby's WEBrick"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-daemon' 'perl-http-message' 'perl-libwww' 'perl-lwp-mediatypes')
makedepends=()
url='http://search.cpan.org/dist/HTTP-Server-Brick'
source=("http://search.cpan.org/CPAN/authors/id/A/AU/AUFFLICK/HTTP-Server-Brick-${pkgver}.tar.gz")
sha512sums=('76ec5f7005e75d8799d3c1ae5ae81951b1efc2f522587d588fa1d562d34632632e7730329cb323191c77ee164f3917fd88656773417fd2c097e577bcf96adc25')
_distdir="HTTP-Server-Brick-${pkgver}"

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
