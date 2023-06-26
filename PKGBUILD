# Maintainer: Manifest0
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-net-ssh2'
pkgver='0.73'
pkgrel='1'
pkgdesc="Support for the SSH 2 protocol via libssh2."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('libssh2>=1.6.0' 'openssl>=1.0.2.d' 'openssl>=1.0.2.d' 'perl>=5.6.0' 'zlib>=1.2.8')
makedepends=()
url='https://metacpan.org/release/Net-SSH2'
source=("https://cpan.metacpan.org/authors/id/R/RK/RKITOVER/Net-SSH2-$pkgver.tar.gz")
sha512sums=('9d0f06f3404127e953a2b625e48de733dca122f95a467a5785ddaedac79c693874dbd904f0dad91c5539688fb89c5dc00e32ff34f005efb1e220784121788c92')
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
