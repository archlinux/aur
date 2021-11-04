# Maintainer: pjvds <pj@born2code.net>
# Maintainer: Hrvoje Juric <5b0bae33-0d7b-4297-b3a5-f6294b4bfd39@anonaddy.me>
_npmname=graphql-language-service-cli
_npmver=3.1.14
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
sha256sums=('f7ef14fca0ddd06bdd1da9bfd2a51f95759c122c16605d0390dbf8733aa2c244')

package() {
  export NODE_ENV=production
  npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${_npmname}-${_npmver}.tgz"
  chown -R root:root "$pkgdir"
}
