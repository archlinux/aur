# Maintainer: envolution
# Contributor: Aaron Coach <aur@awc.id.au>
# shellcheck shell=bash disable=SC2034,SC2154
# ci|prebuild=_verformat.sh| https://github.com/envolution/aur/blob/main/maintain/build/qwen-code/_verformat.sh

pkgname=qwen-code
pkgver=0.0.10n2
_pkgver=0.0.10-nightly.2
pkgrel=2
pkgdesc="cli coding agent (fork of gemini-cli)"
arch=(any)
url="https://github.com/QwenLM/qwen-code"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@qwen-code/$pkgname/-/$pkgname-$_pkgver.tgz")
options=(!lto !strip !debug)
noextract=("$pkgname-$_pkgver.tgz")
sha256sums=('0bfcf9ff205a62d01b8c592bcd0a1a452605d87cac8188f5e2e937f6c76afa73')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${_pkgver}.tgz"
}
# vim:set ts=2 sw=2 et:
