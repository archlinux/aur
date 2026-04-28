# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=muster
pkgname=$_pkgname-bin
pkgver=0.1.127 # renovate: datasource=github-releases depName=giantswarm/muster
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
sha512sums_x86_64=('077c4a35e0dfed867521152c8d106dad8aef368b7436633e8976e20be014d76ba2a1877be760fb6279040d42a1866fdda71b8484d331aa5669edeefa1e398069')
sha512sums_aarch64=('ce881711795cf9bb9aa88fa11b6485ca716a8efc05f3bf95ba5978d706200a7e069433490ee61c4ae321720a80117fca54205dbb67afbb975a51586bc2937f6c')

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
