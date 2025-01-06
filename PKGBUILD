# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-net-cidr'
pkgver='0.21'
pkgrel='1'
pkgdesc="Manipulate IPv4/IPv6 netblocks in CIDR notation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Net-CIDR'
source=('http://search.mcpan.org/CPAN/authors/id/M/MR/MRSAM/Net-CIDR-0.21.tar.gz')
md5sums=('31f6679b361ad734d163d3a9f6589c84')
sha512sums=('28e7c808173d87a403ab6d924763bdeeef61801775167a11b02bf352d70808821f896f7e3dbb1fd3cd2b42c937f9c6175d1522daddf38c53ee9d242d1a3b5fd1')
_distdir="Net-CIDR-0.21"

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
