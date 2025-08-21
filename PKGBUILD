# Maintainer: envolution
# Contributor: Aaron Coach <aur@awc.id.au>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=qwen-code
pkgver=0.0.8_nightly.6
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="cli coding agent (fork of gemini-cli)"
arch=(x86_64 aarch64)
url="https://github.com/QwenLM/qwen-code"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@qwen-code/$pkgname/-/$pkgname-$_pkgver.tgz")
options=(!lto !strip !debug)
noextract=("$pkgname-$_pkgver.tgz")
sha256sums=('30080e0621a75fbfbb2e23acc683a83c5908c1ed779ad74a871c6485cfd573af')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${_pkgver}.tgz"
}
# vim:set ts=2 sw=2 et:
