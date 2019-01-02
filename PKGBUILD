# Maintainer: Amish <contact at via dot aur>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-text-csv-xs
pkgver=1.38
pkgrel=1
pkgdesc="Comma-separated values manipulation routines"
_dist=Text-CSV_XS
arch=('any')
url="https://metacpan.org/release/${_dist}"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/H/HM/HMBRAND/${_dist}-${pkgver}.tgz")
md5sums=('b3bf4096cc2edce38add5fe63216a184')
sha512sums=('a18f4d643c21c038056eeac6ad63dd2c1e26fe7cf28aa49e6e4b51ec85c0e975bdbc07109fe9bf0bbb95d1fe6deb688d83b8dbc50571f4f65f29b925ac4f19ef')

build() {
  cd "${srcdir}/${_dist}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/${_dist}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${srcdir}/${_dist}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
