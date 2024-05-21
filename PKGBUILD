# Maintainer: Maykel Moya <mmoya (at) mmoya.org>
# Contributor: Marcs <aur (at) mg.odd.red>

pkgname=lerna
pkgver=8.1.3
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
sha256sums=('1af740d44c04badf4ce1c9bddab9a4df4ae3053075a1e41904643cbbc6a01909')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
}
