# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-io-aio'
pkgver='4.33'
pkgrel='1'
pkgdesc="Asynchronous Input/Output"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.20' 'perl-common-sense')
makedepends=()
url='http://search.mcpan.org/dist/IO-AIO'
source=('http://search.mcpan.org/CPAN/authors/id/M/ML/MLEHMANN/IO-AIO-4.33.tar.gz')
md5sums=('08243848d09e111ca8a682226a36491f')
sha512sums=('9d59d9ad511bb07178ed760a0387357ade961f9b0e73cdc64861fa3b5674fb4cdb07b44a0c0810cc364909c1bc4fb012c2975269c1e3035cd37ba21a8a029df9')
_distdir="IO-AIO-4.33"

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
