# Maintainer: Max <max@swk-web.com>

_npmname=svelte-language-server
pkgname=nodejs-${_npmname}
pkgver=0.14.33
pkgrel=1
pkgdesc="A language server for Svelte."
arch=('any')
url="https://github.com/sveltejs/language-tools/tree/master/packages/language-server"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
sha256sums=('614d442f25558d21d430480b9321eb64069c19b31f7f152bd1b30b792bb507d7')
noextract=("${_npmname}-${pkgver}.tgz")

package() {
  npm install --global \
    --prefix "${pkgdir}/usr" \
    "${srcdir}/${_npmname}-${pkgver}.tgz"

  find "${pkgdir}/usr" -type d -exec chmod 755 '{}' +
  chown -R root:root "${pkgdir}"
}
