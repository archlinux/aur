# Maintainer: Maykel Moya <mmoya (at) mmoya.org>
# Contributor: Marcs <aur (at) mg.odd.red>

pkgname=lerna
pkgver=6.5.1
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

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
}

sha256sums=('05288dbf9c3fa5523d68ad04e80f69ba88c8e4f00b68c03bb990202d4341ea20')
