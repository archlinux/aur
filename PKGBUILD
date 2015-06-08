# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.21

pkgname='perl-object-role'
pkgver='0.001'
pkgrel='1'
pkgdesc="base class for non-Moose roles"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006' 'perl-sub-name')
makedepends=()
url='http://search.cpan.org/dist/Object-Role'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/Object-Role-0.001.tar.gz')
md5sums=('987718eb0ad4c72fa0ba176aa733457c')
sha512sums=('18eb417581584d1cf61e6860c3bce1fa1fc35b839e6458aba2559cfbd5b3d7144a6f0d2442bb15b9933948853b4839be5406505b011211c34477f053e2efb4b5')
_distdir="${srcdir}/Object-Role-0.001"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
