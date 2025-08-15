# Maintainer: envolution
# Contributor: Aaron Coach <aur@awc.id.au>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=qwen-code
pkgver=0.0.7_nightly.1
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
sha256sums=('e8707ee39d38d398f140edbdaf6b6496905ddafb839419ef73833b411d294c0b')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${_pkgver}.tgz"
}
# vim:set ts=2 sw=2 et:
