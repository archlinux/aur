# Maintainer: Hrvoje Juric <5b0bae33-0d7b-4297-b3a5-f6294b4bfd39@anonaddy.me>
_npmname=graphql-cli
_npmver=4.1.0
pkgname="nodejs-${_npmname}"
pkgver="${_npmver}"
pkgrel=1
pkgdesc="Repo and documentation at: https://github.com/Urigo/graphql-cli"
arch=('any')
url="https://www.npmjs.com/package/graphql-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${_npmname}-${_npmver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
noextract=("${_npmname}-${_npmver}.tgz")
sha256sums=('c52d62ac108d4a3f711dbead0939bd02e3e2d0c82f8480fd76fc28f285602f5c')

package() {
  export NODE_ENV=production
  npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${_npmname}-${_npmver}.tgz"
  chown -R root:root "$pkgdir"
}
