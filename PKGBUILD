# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-http-link'
pkgver='0.001'
pkgrel='1'
pkgdesc="RFC5988 Web Linking"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mime-ecoencode>=0' 'perl>=5.010' 'perl-strictures>=2')
makedepends=()
url='https://metacpan.org/release/HTTP-Link'
source=('https://cpan.metacpan.org/authors/id/Z/ZU/ZURBORG/HTTP-Link-0.001.tar.gz')
md5sums=('5bca6141d7cc195733de1b8291954268')
sha512sums=('3455c7cc37851b4d024ca78db77647172da69edda40fe6f2d2e5d1c77ec7b30b394954ac0173c6896f640b264abd74fc45ecaa11dcd3989f7059159757d6bd03')
_distdir="HTTP-Link-0.001"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
