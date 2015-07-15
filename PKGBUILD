# Maintainer: jose riha <jose 1711 gmail com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-tinkerforge'
pkgver='2.1.4'
pkgrel='1'
pkgdesc="perl binding for the TinkerForge hard-/software"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
url='http://www.tinkerforge.com/en/doc/Software/API_Bindings_Perl.html'
source=("http://download.tinkerforge.com/bindings/perl/tinkerforge_perl_bindings_2_1_4.zip")
md5sums=('ebb1ca6e64d4f22d124666ee77500f2c')
sha512sums=('810cbac499ade0f2cf5c575256819d629feca9fb0297cee521e326522672d68cec0887b0c4c7ddc6645d9e5dd53dc177c0507661997dd557e3a5b27ba57e4e00')
_distdir="Tinkerforge-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/source"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/source"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/source"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
