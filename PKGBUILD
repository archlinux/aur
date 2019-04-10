# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-io-aio'
pkgver='4.72'
pkgrel='1'
pkgdesc="Asynchronous/Advanced Input/Output"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.28' 'perl-common-sense>=0')
makedepends=()
url='https://metacpan.org/release/IO-AIO'
source=('http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/IO-AIO-4.72.tar.gz')
md5sums=('41ccb0bb8d6581e5227c1aab1f420598')
sha512sums=('7b18fac37ed22e504dd43d71ae42a7bbb54843ab013574007e7fee17b3b25c5533a68d3163c89d7a6420266ff825c064405a752f85474816ece66c5fb1468fc1')
_distdir="IO-AIO-4.72"

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
