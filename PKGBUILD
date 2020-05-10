# Contributor: Jie Zhu <alienchuj@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-overrideglobalrequire'
pkgver='0.001'
pkgrel='1'
pkgdesc="Override CORE::GLOBAL::require safely"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Devel-OverrideGlobalRequire'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Devel-OverrideGlobalRequire-0.001.tar.gz')
md5sums=('9cc9b7c3e39629d2f3ae22d347c29f1a')
sha512sums=('33df90e5aa798d899acd73db72651be015c53cc2eaa041bb45d531a7023c32adb886ef63b2f064765a42a47b44eb0cfb80bf39f6c61cf78fa66de1581c41383e')
_distdir="Devel-OverrideGlobalRequire-0.001"

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
