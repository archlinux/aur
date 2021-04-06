# Maintainer: Max <max@swk-web.com>

_npmname=svelte-language-server
pkgname=nodejs-${_npmname}
pkgver=0.13.0
pkgrel=1
pkgdesc="A language server for Svelte."
arch=('any')
url="https://github.com/sveltejs/language-tools/tree/master/packages/language-server"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
sha256sums=('c63116b177897e2214b26af0f78f24b895d95bbf7f9671da68736248b5e448e1')
noextract=("${_npmname}-${pkgver}.tgz")

package() {
  npm install \
    --user root --global \
    --prefix "${pkgdir}/usr" \
    "${srcdir}/${_npmname}-${pkgver}.tgz"

  find "${pkgdir}/usr" -type d -exec chmod 755 '{}' +
  chown -R root:root "${pkgdir}"
}
