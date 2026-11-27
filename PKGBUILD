# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=faf-cli
_npmname=faf-cli
pkgver=8.13.0
pkgrel=1
pkgdesc="Write and maintain context files for AI coding agents"
arch=('any')
url="https://github.com/wolfe-jam/faf-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/faf-cli-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('0878b2640ca5748f46f16bbe81e7edf49fe6aabd98f238446a77c3c1b67a8dc9')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
