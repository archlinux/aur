# Maintainer: Manifest0
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-protocol-websocket'
pkgver='0.26'
pkgrel='1'
pkgdesc="WebSocket protocol"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-digest-sha1>=0')
makedepends=('perl-module-build-tiny')
url='http://search.cpan.org/dist/Protocol-WebSocket'
source=("http://search.cpan.org/CPAN/authors/id/V/VT/VTI/Protocol-WebSocket-$pkgver.tar.gz")
sha512sums=('82384cdbeafc7b37fd4a97471c414e6653d311d1f4cc21de5ea4bbc3e06589df8e0a909e781470e8a84d3d74f6907a851f222338cea3f1f1aa6eb4a276149357')
_distdir="Protocol-WebSocket-$pkgver"

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
