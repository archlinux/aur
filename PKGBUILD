# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-astro-fits-cfitsio'
pkgver='1.15'
pkgrel='2'
pkgdesc="Perl extension for using the cfitsio library"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0' 'glibc>=2.24' 'cfitsio')
makedepends=()
url='https://metacpan.org/release/Astro-FITS-CFITSIO'
source=("http://search.cpan.org/CPAN/authors/id/P/PR/PRATZLAFF/Astro-FITS-CFITSIO-${pkgver}.tar.gz")
md5sums=('b192177a6756655c74361d766ba43cbc')
sha512sums=('5b4792a32f75e9dc7e2c6efb15424aaf75e6b920b3441d9674a1203a47fbf797bdc98d6045dec6422d5932dac536356755e4f9dd493eaa8709703c1f0c874e9b')
_distdir="Astro-FITS-CFITSIO-${pkgver}"

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
