# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=muster
pkgname=$_pkgname-bin
pkgver=0.1.132 # renovate: datasource=github-releases depName=giantswarm/muster
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
sha512sums_x86_64=('2091687622ccde9e9cbd241b29f0d65bd74bb956e365b8cadf44883c9ac5ac22bff6c2ff3c298611a8ce273ad2ec618ce2667b23c665ee3cf44b7b00fa4c9496')
sha512sums_aarch64=('a4d324b112269887fc4d400f548eacaf3f879184a895fb793aaf27f970eb46718f65d7f820496bf8c54c42c68f800ea509120e943a21d6cc81d0ab094501b236')

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
