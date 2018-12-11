# Maintainer: Amish <contact at via dot aur>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-text-csv-xs
pkgver=1.37
pkgrel=2
pkgdesc="Comma-separated values manipulation routines"
_dist=Text-CSV_XS
arch=('any')
url="https://metacpan.org/release/${_dist}"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/H/HM/HMBRAND/${_dist}-${pkgver}.tgz")
md5sums=('496c20cd1c433fa291733eaed4c0c71e')
sha512sums=('dfd8ac9d15c42171f4f7bc2b14829dab737a38c1f9fb825ff595775e2767b495e9c2170bb03dd342cafbdb490a18d3962f958fc41699affe2891e5a7f1889557')

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
