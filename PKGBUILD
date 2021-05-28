# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-io-aio'
pkgver='4.75'
pkgrel='1'
pkgdesc="Asynchronous/Advanced Input/Output"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.33' 'perl-common-sense>=0')
makedepends=('perl-canary-stability')
url='https://metacpan.org/release/IO-AIO'
source=('http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/IO-AIO-4.75.tar.gz')
md5sums=('04edb0cb77d9ec19f73b8aa46d5b3d05')
sha512sums=('3a30b34d6de476accc9b07c0723a3b21c235e5bd2b5951edc3ce3150de22a6b7dab5634d78ec17b799a71f2ede0bc138fead1e02885eed31a4da5cec05dfcaa3')
_distdir="IO-AIO-4.75"

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
