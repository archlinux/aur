# Maintainer: Max <max@swk-web.com>

_npmname=svelte-language-server
pkgname=nodejs-${_npmname}
pkgver=0.14.38
pkgrel=1
pkgdesc="A language server for Svelte."
arch=('any')
url="https://github.com/sveltejs/language-tools/tree/master/packages/language-server"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
sha256sums=('573e20b8b5293c75869259cfe93b5b3bce00f0abb73532ec6d61b254d0f0caf2')
noextract=("${_npmname}-${pkgver}.tgz")

package() {
  npm install --global \
    --prefix "${pkgdir}/usr" \
    "${srcdir}/${_npmname}-${pkgver}.tgz"

  find "${pkgdir}/usr" -type d -exec chmod 755 '{}' +
  chown -R root:root "${pkgdir}"
}
