# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-moosex-lazyrequire'
pkgver='0.10'
pkgrel='1'
pkgdesc="Required attributes which fail only when trying to use them"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.94' 'perl-aliased>=0.30' 'perl-namespace-autoclean>=0')
makedepends=()
checkdepends=('perl-test-checkdeps>=0.002' 'perl-test-fatal>=0')
url='http://search.cpan.org/dist/MooseX-LazyRequire'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-LazyRequire-0.10.tar.gz')
md5sums=('d79e895f72f75de2d58dd272069ed6fc')
sha512sums=('c2f600d55493093338153a458f2067c8a39c1aad4d33324720a3418d249268a46b8f9ae8a2bcdcd40aa2d1cacc15c9a936af3e8f747bde4bd725d07b74058eee')
_distdir="MooseX-LazyRequire-0.10"

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
