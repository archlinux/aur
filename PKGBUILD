# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=muster
pkgname=$_pkgname-bin
pkgver=5.19.7 # renovate: datasource=github-releases depName=giantswarm/muster
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
sha512sums_x86_64=('f70766c3add3e6ff3e0e2b06d14fe188aed17520ca33b7fffa88bd4b617c921a734fefa8aefbf729dc5e1ad96f093b5b3f58b0be46909c940c3add6a90800918')
sha512sums_aarch64=('3d89fbbbc033f3d049b1ea383c6fef7b490f99a29aa751f298781f87957ed73e145779089119661b9d807db0cd83cae531bc0bc6c046ef74d76c8c32ed3220d2')

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
