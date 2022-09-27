# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-io-aio'
pkgver='4.79'
pkgrel='1'
pkgdesc="Asynchronous/Advanced Input/Output"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.33' 'perl-common-sense>=0')
makedepends=('perl-canary-stability')
url='https://metacpan.org/release/IO-AIO'
source=("http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/IO-AIO-${pkgver}.tar.gz")
md5sums=('851fac98cf21ed9c3d69a2ddc395bde6')
sha512sums=('ebf4030ee237dde044722e690e1996c22a8c2fa36325c1d5fc641879da9da64facf2300defa759854499c010408a0dfba0cee3191aa024e8332d3aed9b2a4cae')
_distdir="IO-AIO-${pkgver}"

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
