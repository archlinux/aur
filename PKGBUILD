# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-zmq-constants'
pkgver='1.04'
pkgrel='1'
pkgdesc="Constants for libzmq"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/ZMQ-Constants'
source=('http://search.mcpan.org/CPAN/authors/id/D/DM/DMAKI/ZMQ-Constants-1.04.tar.gz')
md5sums=('993961a924f88de186419b590266d9c0')
sha512sums=('a6ada74282c82713b724c5592606cc836a46e0e480477355d6cd7b27fe9afcbe0ce46dda28bf8ea184cc12a4d6a2ec7d9ba6870db59a88c69f37ac1f8f7c726f')
_distdir="ZMQ-Constants-1.04"

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
