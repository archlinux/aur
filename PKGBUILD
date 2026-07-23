# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=muster
pkgname=$_pkgname-bin
pkgver=1.2.1 # renovate: datasource=github-releases depName=giantswarm/muster
pkgrel=1
pkgdesc="MCP tool management and workflow proxy"
url="https://github.com/giantswarm/$_pkgname"
license=('Apache-2.0')
arch=('x86_64' 'aarch64')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")
source_x86_64=(
  "$_pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/${_pkgname}-linux-amd64"
)
source_aarch64=(
  "$_pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/${_pkgname}-linux-arm64"
)
sha512sums_x86_64=('b2a66c3174d4271eaf4e6325c569c1084e1c85eca9cc35f35a5b12f16d2a28287d44a6ac649d6197c3e68646345c11ed007a0a46c1f12cba3e25382d1ea2b534')
sha512sums_aarch64=('8eab9c5175cd60d1a802c4798eb5e549d481b08ee87105a4d63db52d5f123f9043647c6c69023497cda6a55190dc3a7da80c5dab2d3dcdf4fc6da04fd7c17151')

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
