# Maintainer: envolution
# Contributor: Aaron Coach <aur@awc.id.au>
# shellcheck shell=bash disable=SC2034,SC2154
# ci|prebuild=_verformat.sh| https://github.com/envolution/aur/blob/main/maintain/build/qwen-code/_verformat.sh

pkgname=qwen-code
pkgver=0.4.0p0
_pkgver=0.4.0-preview.0
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
sha256sums=('5707908c566e04115a931d05e8253205021bf78b85f2181c237df7b1cc92267b')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${_pkgver}.tgz"
}
# vim:set ts=2 sw=2 et:
