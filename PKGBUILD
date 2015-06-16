# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-net-bittorrent'
pkgver='0.052'
pkgrel='1'
pkgdesc="BitTorrent peer-to-peer protocol"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.8')
makedepends=()
url='http://search.cpan.org/dist/Net-BitTorrent'
source=('http://search.cpan.org/CPAN/authors/id/S/SA/SANKO/Net-BitTorrent-0.052.tar.gz')
md5sums=('aca81c2b804a2bcdf0d1693ca83bd03f')
sha512sums=('5e3b79bf644290756e190e26f2a5fba44c88d4fb9c007ff57c37cd0305f05f11ff7409e061a8e1d3f44367ba385b130c86f6be4b343e5e190459a3df6eafe062')
_distdir="Net-BitTorrent-0.052"

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
