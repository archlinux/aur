# Maintainer: noureddinex
# Contributor: envolution
# Contributor: Aaron Coach <aur@awc.id.au>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=qwen-code
pkgver=0.10.3
_pkgver=${pkgver}
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
sha256sums=('0b8989432f962b88659bd892db48a0a9e0b1b37840539ac53a271018d98d1fd6')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${_pkgver}.tgz"
}
