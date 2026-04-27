# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=muster
pkgname=$_pkgname-bin
pkgver=0.1.121 # renovate: datasource=github-releases depName=giantswarm/muster
pkgrel=1
pkgdesc="MCP tool management and workflow proxy"
url="https://github.com/giantswarm/$_pkgname"
license=('Apache-2.0')
arch=('x86_64' 'aarch64')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")
source_x86_64=(
  "$_pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/${_pkgname}_linux_amd64"
)
source_aarch64=(
  "$_pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/${_pkgname}_linux_arm64"
)
sha512sums_x86_64=('a1cdbb28de5e2ef71abbd05c8119b79dfe80e8453e9ff413f1a392f546da5a034ddf6b59c26e4be8b1ad91e5ac029b5cceab98a8a55568e1ed0371127be3432e')
sha512sums_aarch64=('0f0cd9278dcfc08a39880c8d07bb4c3f575f957c92a1523e9a4f11de4284fd33c046fe77305d6ee51069e1964a952119d34e1ac927338ed6193a7a156d05ffc0')

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
