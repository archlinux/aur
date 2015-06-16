# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-geo-ip'
pkgver='1.43'
pkgrel='1'
pkgdesc="Look up location and network information by IP Address"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0' 'geoip>=1.5.1')
makedepends=()
url='http://search.cpan.org/dist/Geo-IP'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BORISZ/Geo-IP-1.43.tar.gz')
md5sums=('1a24af3f3b78f7a6c613e06b91593d10')
sha512sums=('f848b4204138db82213b09d9193afc98d8bff04290cb4ad147196e136e3f2e17205bbc3123892208fedb20ae2785d0573517cd3c7de7804ce9424ee9688ce5fb')
_distdir="Geo-IP-1.43"

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
