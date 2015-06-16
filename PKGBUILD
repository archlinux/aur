# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-net-ssh2'
pkgver='0.53'
pkgrel='1'
pkgdesc="Support for the SSH 2 protocol via libssh2."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('libssh2>=1.4.3' 'openssl>=1.0.1.j' 'perl' 'zlib>=1.2.8')
makedepends=()
url='http://search.mcpan.org/dist/Net-SSH2'
source=('http://search.mcpan.org/CPAN/authors/id/R/RK/RKITOVER/Net-SSH2-0.53.tar.gz')
md5sums=('f8a2c3ebb3bd191635e00a68a3d5f015')
sha512sums=('c3aaa97f2c5fe987c5f28fca2d6687b6ff759d6ab70f6136e581f439cd06af70de5410628187c94168db43464e0713eeed9f50185f7bf0305fd01e0ac7ee5817')
_distdir="Net-SSH2-0.53"

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
