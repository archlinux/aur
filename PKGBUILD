# Maintainer: Manifest0
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-protocol-websocket'
pkgver='0.24'
pkgrel='1'
pkgdesc="WebSocket protocol"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-digest-sha1>=0')
makedepends=()
url='http://search.cpan.org/dist/Protocol-WebSocket'
source=("http://search.cpan.org/CPAN/authors/id/V/VT/VTI/Protocol-WebSocket-$pkgver.tar.gz")
md5sums=('dedb9413da61aeeb9ade69e883a4a3d9')
sha512sums=('f5834963436c76697473185c5d9038b1fe160a740910c0db02ced361860211b6c865ae533a321c50d60bfd08d5e3efa04700bb9588650eacda3232977c98ce05')
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
