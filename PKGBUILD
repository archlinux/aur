# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=muster
pkgname=$_pkgname-bin
pkgver=5.66.0 # renovate: datasource=github-releases depName=giantswarm/muster
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
sha512sums_x86_64=('7f450bb1b23e616464c046c5d4c049760a7b2de896b8b5388ad9cf8b74e2ce79874b134bc717b367ab53079380cb21a5a2a1140c26eedd9103eb2a0fd951d8b1')
sha512sums_aarch64=('4c4551bdb319b26de2e62d467db9245b8243bbf79bf2cea74b0f380091621b8939959d83ad9fd615e736876ce0b95c511d6fb54f13d7c311f9212d2499704af1')

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
