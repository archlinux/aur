# CPAN Name : Taint::Util
# Maintainer: Ordoban <dirk.langer@vvovgonik.de>

pkgname=perl-taint-util
_pkgname='Taint-Util'
pkgver=0.08
pkgrel=4
pkgdesc="Perl module to test for and flip the taint flag without regex matches or eval"
arch=("i686" "x86_64")
url="https://metacpan.org/pod/Taint::Util"
license=("PerlArtistic")
depends=("perl>=5.6.2")
source=(https://cpan.metacpan.org/authors/id/A/AV/AVAR/${_pkgname}-${pkgver}.tar.gz)
options=(!emptydirs)
md5sums=("4f081a8a6e82352741c0486784cbc23d")

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make test
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
  find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}
