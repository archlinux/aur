# Maintainer: envolution
# Contributor: Aaron Coach <aur@awc.id.au>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=qwen-code
pkgver=0.0.5_nightly.9
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
sha256sums=('815000f2193489e8ae0fa736375e681a479f58d7c6e2f883d6da1edc46b9e3cf')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${_pkgver}.tgz"
}
# vim:set ts=2 sw=2 et:
