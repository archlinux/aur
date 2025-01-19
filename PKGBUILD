# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=nodejs-all-the-package-names
_pkgname=all-the-package-names
pkgver=2.0.1989
pkgrel=1
pkgdesc="🔤 A list of all the public package names on npm. Updated daily."
arch=(any)
url="https://github.com/nice-registry/all-the-package-names"
license=('MIT')
depends=(nodejs)
makedepends=(npm)
options=(!emptydirs)
source=(https://registry.npmjs.org/$_pkgname/-/all-the-package-names-${pkgver//_/-}.tgz)
noextract=(all-the-package-names-${pkgver//_/-}.tgz)
sha256sums=('6b72c83fcfe1c2de098dc2701a49f08ac4f60b41d00426135a9690f638fbb327')

package() {
	npm install --omit=dev -g --prefix "${pkgdir}/usr" "${srcdir}/all-the-package-names-${pkgver//_/-}.tgz"
	rm -vrf ${pkgdir}/usr/lib/node_modules/all-the-package-names/script
}
