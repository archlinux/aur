# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-protocol-websocket'
pkgver='0.16'
pkgrel='1'
pkgdesc="WebSocket protocol"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-digest-sha1>=0')
makedepends=()
url='http://search.cpan.org/dist/Protocol-WebSocket'
source=('http://search.cpan.org/CPAN/authors/id/V/VT/VTI/Protocol-WebSocket-0.16.tar.gz')
md5sums=('bebdc21b9a895bc46901d6269b28410e')
sha512sums=('b3e01a7f4ec4bf8ed40c7b8d10a20c5b9c141145b273d0e89ac602acb015cb345d274c00f0d48c6eebd4f5312db6cdf8c94d55448bf21b83342b40c9212c1afc')
_distdir="Protocol-WebSocket-0.16"

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
