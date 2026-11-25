# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=muster
pkgname=$_pkgname-bin
pkgver=5.66.2 # renovate: datasource=github-releases depName=giantswarm/muster
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
sha512sums_x86_64=('0d8acf552f0f25ba793c75b1411bca460a2575898871593a98bbb1f2aafc4db55118579b6aee740bb336866e92d8e93db736b7ff74607a9eacdf00d241c99bf6')
sha512sums_aarch64=('c608fbea67c755d6236ef900e3dcfaf73c2314077f3faa535cf29c5c312689ca148c108deb5760895adb019d56b011142e476f4c4ae2fcf688c83b0c9c171ee4')

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
