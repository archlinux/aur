# Maintainer: Amish <contact at via dot aur>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname=perl-encode-detect
pkgver=1.01
pkgrel=5
pkgdesc="An Encode::Encoding subclass that detects the encoding of data"
_dist=Encode-Detect
arch=('any')
url="https://metacpan.org/release/${_dist}"
license=('GPL' 'PerlArtistic')
depends=('perl')
makedepends=('perl-module-build')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/J/JG/JGMYERS/${_dist}-${pkgver}.tar.gz")
md5sums=('ee9faf55d7105c97b02b8ebe590819c7')
sha512sums=('cc9c81f716dcb61abb321abd84e4ebb95a674d9aa34c4265f58cace38f6d15ef4f2b8338190ae7d200672e047b795a30ce6155f9c1b1c424e25d962579b96224')

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

# vim:set ts=2 sw=2 et:
