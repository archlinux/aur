# Contributor:   Lucky <archlinux@builds.lucky.li>
# Contributor:  Tsekhovoy Eugene aka Krash <8552246@gmail.com>
# Maintainer: izmntuk
pkgname=perl-lockfile-simple
_pkgname="LockFile-Simple"
pkgver=0.208
pkgrel=1
pkgdesc="Perl/CPAN Module Crypt::Simple"
url="http://search.cpan.org/dist/LockFile-Simple"
license=("GPL" "PerlArtistic")
arch=("any")
source=("http://search.cpan.org/CPAN/authors/id/S/SC/SCHWIGON/${pkgname#perl-}/${_pkgname}-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make pure_install doc_install DESTDIR="${pkgdir}"

  find "${pkgdir}" -name ".packlist" -delete
  find "${pkgdir}" -name "*.pod" -delete
}
