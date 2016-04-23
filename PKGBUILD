# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-geo-ip'
pkgver='1.45'
pkgrel='1'
pkgdesc="Look up location and network information by IP Address"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'geoip>=1.6.6')
makedepends=()
url='https://metacpan.org/release/Geo-IP'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MAXMIND/Geo-IP-1.45.tar.gz')
md5sums=('781fbf2a6b6505e86e3e5ebe05254928')
sha512sums=('0737459b50251f64a0230176721e6a0cf7fb701451b3488c0a0628a183233b5346b7311a80fe35752104ab6812c6791cd4bafbbfa9e7ff51aa6bd4d489655af3')
_distdir="Geo-IP-1.45"

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
