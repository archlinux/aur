# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=muster
pkgname=$_pkgname-bin
pkgver=1.12.0 # renovate: datasource=github-releases depName=giantswarm/muster
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
sha512sums_x86_64=('589ea004d3f6397404742a64c327c42b859de8e9b7abf5a54625b9ed5c0569a49b9776e57991aaa16dd06218171356424bd21e67336484a87885fec5e058444b')
sha512sums_aarch64=('08602b2a373b80546ff3d1e7feb57f493df5de7c9a74ce904ccc541e9a323633748c525c3d32fe3fe49264a7dc7e9417fcb0c33d8455837c6381c81317a111c7')

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
