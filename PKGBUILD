# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-astro-fits-cfitsio'
pkgver='1.11'
pkgrel='1'
pkgdesc="Perl extension for using the cfitsio library"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0' 'glibc>=2.24' 'cfitsio')
makedepends=()
url='https://metacpan.org/release/Astro-FITS-CFITSIO'
source=('http://search.cpan.org/CPAN/authors/id/P/PR/PRATZLAFF/Astro-FITS-CFITSIO-1.11.tar.gz')
md5sums=('99526138ddeaee2f14f364d2406b1ee9')
sha512sums=('e823831c51f20ea775b66c0fa3855451ca0b9de984968daa07e365b86151578a4424089d21c5b7528c15c1eb49e9517935f266d60c1b074ce7d9d02265fc20a5')
_distdir="Astro-FITS-CFITSIO-1.11"

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
