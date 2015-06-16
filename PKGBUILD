# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-zmq-libzmq3'
pkgver='1.19'
pkgrel='1'
pkgdesc="A libzmq 3.x wrapper for Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-task-weaken' 'perl-zmq-constants' 'zeromq>=4.0.5')
makedepends=('perl-devel-checklib>=0.4')
checkdepends=('perl-test-fatal' 'perl-test-requires' 'perl-test-tcp>=1.08')
url='http://search.mcpan.org/dist/ZMQ-LibZMQ3'
source=('http://search.mcpan.org/CPAN/authors/id/D/DM/DMAKI/ZMQ-LibZMQ3-1.19.tar.gz')
md5sums=('c1514be966e4db371d9eb5f5e05eac3a')
sha512sums=('feffe5273710d01cd09a9a96c311b94fe15054cc8a251b4d74d7af34c48480e017ec5fdde17fd7fc551b2b4566030858ebb1004c44fdcdfc377b38178f0449d5')
_distdir="ZMQ-LibZMQ3-1.19"

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
