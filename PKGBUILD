# Maintainer: pjvds <pj@born2code.net>
# Maintainer: Hrvoje Juric <5b0bae33-0d7b-4297-b3a5-f6294b4bfd39@anonaddy.me>
_npmname=graphql-language-service-cli
_npmver=3.2.23
pkgname=graphql-lsp
provides=('graphql-language-service-cli')
pkgver="${_npmver}"
pkgrel=3
pkgdesc="GraphQL Language Service provides an interface for building GraphQL language services for IDEs."
arch=('any')
url="https://www.npmjs.com/package/graphql-language-service-cli"
depends=('nodejs')
makedepends=('npm')
source=("${_npmname}-${_npmver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
noextract=("${_npmname}-${_npmver}.tgz")
sha256sums=('28a79267b8e61f7b3185fa2df0ec03e66c8c31a8d97d9624cd4fc7baed09d692')

package() {
  export NODE_ENV=production
  npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${_npmname}-${_npmver}.tgz"
  chown -R root:root "$pkgdir"
}
