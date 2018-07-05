# Maintainer: David A. Redick <david.a.redick@gmail.com>
# Contributor: Petteri Tolonen <petteri dot tolonen at gmail dot com>

# Most of this is ripped from the project's own .spec file.
# See http://git.savannah.gnu.org/cgit/freedink/freedink-data.git/tree/freedink-data.spec

pkgname=freedink-data
pkgver=1.08.20170409
pkgrel=2
pkgdesc='Humorous top-down adventure and role-playing game assets.'
arch=('any')
url='https://www.gnu.org/software/freedink/'
# Multiple cross licenses allowed.
license=('GPL3' 'custom')
depends=()
makedepends=('make')
optdepends=()
source=("ftp://ftp.gnu.org/gnu/freedink/${pkgname}-${pkgver}.tar.gz")
md5sums=('ab321404812e14999b624c038f885445')
sha256sums=('e1f1e23c7846bc74479610a65cc0169906e844c5193f0d83ba69accc54a3bdf5')
sha512sums=('8ce6bd0de33da0edd42722c2a7d02aae54a3e8e81fc8e0a4c97d9b2b696e58eb41e05e12b3fc1cd4be72be7bcf799988d50affb3689f3fec8e2e78c878cd4afc')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# Multiple cross licenses allowed.
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp licenses/* "${pkgdir}/usr/share/licenses/${pkgname}"

	make DESTDIR="${pkgdir}" PREFIX=/usr install
}

