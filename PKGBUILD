# Maintainer: envolution
# Contributor: Aaron Coach <aur@awc.id.au>
# shellcheck shell=bash disable=SC2034,SC2154
# ci|prebuild=_verformat.sh| https://github.com/envolution/aur/blob/main/maintain/build/qwen-code/_verformat.sh

pkgname=qwen-code
pkgver=0.0.15n3
_pkgver=0.0.15-nightly.3
pkgrel=1
pkgdesc="cli coding agent (fork of gemini-cli)"
arch=(any)
url="https://github.com/QwenLM/qwen-code"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@qwen-code/$pkgname/-/$pkgname-$_pkgver.tgz")
options=(!lto !strip !debug)
noextract=("$pkgname-$_pkgver.tgz")
sha256sums=('ac08d0d5c2041e090e496570dd4c9a0510dbd99c10f225440b0aebc16db588bb')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${_pkgver}.tgz"
}
# vim:set ts=2 sw=2 et:
