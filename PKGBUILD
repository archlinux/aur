# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-io-aio'
pkgver='4.81'
pkgrel='2'
pkgdesc="Asynchronous/Advanced Input/Output"
arch=('i686' 'x86_64')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('glibc>=2.40' 'perl-common-sense')
makedepends=('perl-canary-stability')
url='https://metacpan.org/release/IO-AIO'
source=("http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/IO-AIO-${pkgver}.tar.gz")
md5sums=('efd22ccb3d38a45ba6c95c9477e70c6d')
sha512sums=('b0e779f8a0a4b8d1d317535030ea7b82d60c06caa7be2afdb5d922f6c3211590e6579d84f7fe2c9cdf808731cb92f501ccab05f4a5fc2f650c6286218e21a92d')
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
