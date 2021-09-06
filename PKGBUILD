# Maintainer: Max <max@swk-web.com>

_npmname=svelte-language-server
pkgname=nodejs-${_npmname}
pkgver=0.14.7
pkgrel=1
pkgdesc="A language server for Svelte."
arch=('any')
url="https://github.com/sveltejs/language-tools/tree/master/packages/language-server"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
sha256sums=('2d6016dd249b3b6db24ee8770b44299551aa833633efa28e85195aa02b3c8d08')
noextract=("${_npmname}-${pkgver}.tgz")

package() {
  npm install --global \
    --prefix "${pkgdir}/usr" \
    "${srcdir}/${_npmname}-${pkgver}.tgz"

  find "${pkgdir}/usr" -type d -exec chmod 755 '{}' +
  chown -R root:root "${pkgdir}"
}
