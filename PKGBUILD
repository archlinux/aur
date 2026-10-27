# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=muster
pkgname=$_pkgname-bin
pkgver=5.52.27 # renovate: datasource=github-releases depName=giantswarm/muster
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
sha512sums_x86_64=('df0d80e58bdaec074d4bef6fa14fe7638288feb50cc77006545b85d6d9e791a91cbe8c4dfc674c4cbbda0d4127bcc2c335a9d8c27c4a5fcb088ff7d0cea3739f')
sha512sums_aarch64=('16a91bd972a1d1f40ab35811a8b90a638e6596200fb1911f41aafe943c7fd5c2b309cee4ad3f773b6fc02408ca6e3dd4222e591fb30c8bd4c380b39dd28fddd3')

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
