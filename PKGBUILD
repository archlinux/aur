# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agtop-ts
_npmname=@ldegio/agtop
pkgver=0.6.1
pkgrel=1
pkgdesc="top-style TUI for monitoring AI coding agent sessions"
arch=('any')
url="https://github.com/ldegio/agtop"
license=('GPL-2.0-only')
depends=('nodejs')
makedepends=('npm')
conflicts=('agtop')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/agtop-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('45515d7532be3721e4804b3fa921f6f4ff7dc95304378649e2b97f42ed045367')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
