# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-net-ftp-autoreconnect'
pkgver='0.3'
pkgrel='1'
pkgdesc="FTP client class with automatic reconnect on failure"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Net-FTP-AutoReconnect'
source=('http://search.cpan.org/CPAN/authors/id/G/GI/GIFF/Net-FTP-AutoReconnect-0.3.tar.gz')
md5sums=('0e25887641efe59b6fd2dd6964fb77a7')
sha512sums=('cdb2796399c0440741f17b4b48c6ee66647a8b01ddde48430d03ddacb360f798c40ebfb3c8b4604963ac6ff6f78ce022d8d791a6df6d73b1d5c04b0f328509c1')
_distdir="Net-FTP-AutoReconnect-0.3"

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
