# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-role-tiny'
pkgver='2.000000'
pkgrel='1'
pkgdesc="Roles. Like a nouvelle cuisine portion size slice of Moose."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
checkdepends=('perl-test-fatal>=0.003')
url='http://search.cpan.org/dist/Role-Tiny'
source=('http://search.cpan.org/CPAN/authors/id/H/HA/HAARG/Role-Tiny-2.000000.tar.gz')
md5sums=('1005f7d427590aac51b1e734b8a2febc')
sha512sums=('afa256d6a5882e7a466294fb0b24bad31fbb5c28e080cd072e704a05b15b702aabe3deb16deddedc892450345c06e2c5cbf0acbaf66432b3982fd481a92db40f')
_distdir="Role-Tiny-2.000000"

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
