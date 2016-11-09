# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-astro-fits-header'
pkgver='3.07'
pkgrel='1'
pkgdesc="Object Orientated interface to FITS HDUs"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0' 'perl-astro-fits-cfitsio' 'perl-starlink-ast')
makedepends=()
url='https://metacpan.org/release/Astro-FITS-Header'
source=('http://search.cpan.org/CPAN/authors/id/T/TJ/TJENNESS/Astro-FITS-Header-3.07.tar.gz')
md5sums=('3a9795ecc74269419340e900018a5840')
sha512sums=('21b72ca2727fd77c6da01407ab97ac1bc3bfb4f6864d7a4728fa3f9cbad07b64ca20445bc8daf6c34a3523ab16a2b688cf99936157a41f36147b39f05a6c1f90')
_distdir="Astro-FITS-Header-3.07"

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
