# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-stun-client'
pkgver='0.04'
pkgrel='1'
pkgdesc="Session Traversal Utilities for NAT (STUN) client. (RFC 5389)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-validate-ip' 'perl-moose' 'perl-string-random' 'perl-stun-rfc')
makedepends=('perl-test-exception' 'perl-test-useallmodules')
url='http://search.cpan.org/dist/STUN-Client'
source=('http://search.cpan.org/CPAN/authors/id/T/TB/TBR/STUN-Client-0.04.tar.gz')
md5sums=('87e1f0c75e5e7bb17db1cb6500c4d1ef')
sha512sums=('7ed5652ae4566abfb94f2d17da1ea33e8e3bda3e0f23be1d8803b427892460fce41cc8345d68a5d26da32c7a9d6fc88f3e6f3dfa486a64ea2e711e5d50ec3633')
_distdir="STUN-Client-0.04"

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
