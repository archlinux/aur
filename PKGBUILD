# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=muster
pkgname=$_pkgname-bin
pkgver=1.3.5 # renovate: datasource=github-releases depName=giantswarm/muster
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
sha512sums_x86_64=('b6372b66dba768d5c8768495d9612440f0af8356712f8e2739a2d646b3b3835d85d48b07578853ca3437d36a162a5e427a0098f82474932be07a515f50957343')
sha512sums_aarch64=('a4aec941fe38f3b3b1b409728b696ec7e8cc72406d5e07c0c9aaf0f3c49ff566c0e9f8eec88f541feba1827cb341df1f2391db6b8e8897aef41ab7f6613b03c1')

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
