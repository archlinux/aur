# Maintainer: Max <max@swk-web.com>

_npmname=svelte-language-server
pkgname=nodejs-${_npmname}
pkgver=0.15.2
pkgrel=1
pkgdesc="A language server for Svelte."
arch=('any')
url="https://github.com/sveltejs/language-tools/tree/master/packages/language-server"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
sha256sums=('a395ea0218bf1f31f60ebe44a6d8ab6742047d085c2094c852354476c4f87ac5')
noextract=("${_npmname}-${pkgver}.tgz")

package() {
  npm install --global \
    --prefix "${pkgdir}/usr" \
    "${srcdir}/${_npmname}-${pkgver}.tgz"

  find "${pkgdir}/usr" -type d -exec chmod 755 '{}' +
  chown -R root:root "${pkgdir}"
}
