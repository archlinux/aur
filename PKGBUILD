# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-getopt-long-descriptive
pkgver=0.114
pkgrel=1
pkgdesc="Getopt::Long, but simpler and more powerful"
arch=('any')
url="https://metacpan.org/dist/Getopt-Long-Descriptive"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-params-validate' 'perl-sub-exporter' 'perl-getopt-long>=2.55')
checkdepends=('perl-cpan-meta-check' 'perl-test-fatal' 'perl-test-warnings')
source=("https://backpan.cpan.org/modules/by-authors/id/R/RJ/RJBS/Getopt-Long-Descriptive-${pkgver}.tar.gz")
sha512sums=('f7d640f0ecfc2619036f8df3e5e6a85334a814f05156e7b056cee3add372225898701c7772e7507bcf87174d6c2bf3a699fc3f924e7fdcc8837457598e35ef7a')

build() {
  cd "${srcdir}/Getopt-Long-Descriptive-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Getopt-Long-Descriptive-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Getopt-Long-Descriptive-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
