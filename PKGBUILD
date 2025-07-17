# Maintainer: Manifest0
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-net-ssh2'
pkgver='0.74'
pkgrel='1'
pkgdesc="Support for the SSH 2 protocol via libssh2."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('libssh2>=1.6.0' 'openssl>=1.0.2.d' 'openssl>=1.0.2.d' 'perl>=5.6.0' 'zlib>=1.2.8')
makedepends=()
url='https://metacpan.org/release/Net-SSH2'
source=("https://cpan.metacpan.org/authors/id/R/RK/RKITOVER/Net-SSH2-$pkgver.tar.gz")
sha512sums=('cdaed673b9e773565228d31a0f78063789c3355d3056c1a45eff887ed5a6427cac42d3350d1f28915dd90c0abd523927b8a23b2586e595a922118ddadb7d11a9')
_distdir="Net-SSH2-$pkgver"

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
