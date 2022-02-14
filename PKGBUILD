# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: senorsmile
# Contributor: Max Roder <maxroder@web.de>

pkgname=perl-bsd-resource
pkgver=1.2911
pkgrel=4
pkgdesc="BSD process resource limit and priority functions"
arch=('x86_64')
url='https://metacpan.org/dist/BSD-Resource'
license=('PerlArtistic' 'GPL')
depends=('perl')
checkdepends=('perl-test-pod' 'perl-test-pod-coverage')
source=("https://www.cpan.org/modules/by-module/BSD/BSD-Resource-${pkgver}.tar.gz")
sha512sums=('d0032d41c7c0468ed1c6d8f57b885f6cb97a5039d754c8cb60b2067daedaf53bd15fb6561a3d0f828df16dfa5417f663b8065ba65f4fea16dc9262728b3b6b85')

build() {
  cd "${srcdir}/BSD-Resource-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/BSD-Resource-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/BSD-Resource-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
