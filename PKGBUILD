# Maintainer: Maykel Moya <mmoya (at) mmoya.org>
# Contributor: Marcs <aur (at) mg.odd.red>

pkgname=lerna
pkgver=8.2.1
pkgrel=1
pkgdesc="A fast, modern build system for managing and publishing multiple JavaScript/TypeScript packages from the same repository."
arch=(any)
url="https://github.com/lerna/lerna"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
options=(!strip)
sha256sums=('f15773dc6cf8ac484bf2ecff19407eed74d09b37f23462ae39f3b9d332abfeae')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
}
