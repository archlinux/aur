# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=muster
pkgname=$_pkgname-bin
pkgver=5.65.1 # renovate: datasource=github-releases depName=giantswarm/muster
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
sha512sums_x86_64=('85e5154cde4c4508ee1fbefddf6b55c90ce563988b3caa7c89ecda7abedd07733d67477e5f96c8fa17750efdb7c8366332c8faca77fa710f7d964fc47e7c47ea')
sha512sums_aarch64=('8fe5e4b159d4aa435a6cd066e6e1a5cb6bb6ddefedc7e1c24d81864e01343f52d1790da1b38af636474ae71524526373cf0c0ec0959b3e2d029d9fcf481b1acd')

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
