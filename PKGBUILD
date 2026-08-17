# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=muster
pkgname=$_pkgname-bin
pkgver=1.4.4 # renovate: datasource=github-releases depName=giantswarm/muster
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
sha512sums_x86_64=('aa0f9ab22b6a5aec3ec7ac9b892a8ffa9c880d6fb06a3474047132b41da36f4e5699cdca0ff4a112d2f4733fbe7a008d610c10f27c90cf84b571ca0fe44b2661')
sha512sums_aarch64=('cee632a41cee60a39a38367be3e77d7afa207e1d6dda573c9a6dffb3110396bd8a5d76773566eb52d218d099afb4008115bb791aa5fed924f5839c7a509941c4')

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
