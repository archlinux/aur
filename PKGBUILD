# Maintainer: Maykel Moya <mmoya (at) mmoya.org>
# Contributor: Marcs <aur (at) mg.odd.red>

pkgname=lerna
pkgver=9.0.7
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
sha256sums=('c98524665b4c4836ac7a88e18c7c24a46f5fd6bf3833a40c576788fdd45bef3c')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
}
