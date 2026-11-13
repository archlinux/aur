# Maintainer: Nikolai Käck <nikolaikack@nikoware.com>

pkgname=internxt-cli
_pkgname=cli
_scope=internxt
pkgver=1.6.11
pkgrel=1
pkgdesc="CLI tool to interact with Internxt encrypted cloud storage and WebDAV"
arch=('x86_64')
url="https://github.com/internxt/cli"
license=('GPL-3.0-only')
depends=('nodejs>=22.13.0')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/@${_scope}/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('8a05fc2e2e6c0753ae0d7fe739b1953e91c4719220a3983a4b2ecc2c6220c4bb')

package() {
  npm install -g --prefix="${pkgdir}/usr" --cache="${srcdir}/npm-cache" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  rm -rf "${pkgdir}/usr/lib/node_modules/@${_scope}/${_pkgname}/node_modules/.cache"
}
