# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=muster
pkgname=$_pkgname-bin
pkgver=0.1.128 # renovate: datasource=github-releases depName=giantswarm/muster
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
sha512sums_x86_64=('e39ea9bd7c600338f18bc0940269118aabe2120a02a5ec71441409c56777e4ee52e78ac6c3ea2111228fa2329efc7e7405426abd32fb05490c9f71dd343cce6d')
sha512sums_aarch64=('ec6f4c9e35dd72b839eb792ba7187a9b71ae1f1c0762871ef13cc6ff63cc5bde291986a016b2ea6a832973f28743513cd914642f67f8b0972127cad7ad394d3a')

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
