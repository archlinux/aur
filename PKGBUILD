# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=muster
pkgname=$_pkgname-bin
pkgver=0.1.112 # renovate: datasource=github-releases depName=giantswarm/muster
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
sha512sums_x86_64=('9c0d74763d7d100762e42c1c7daf8ee3d6bdec6c12f0037f80faebd05b06bdb563ff63685640e0c7f4ffc9ede49e1ec2f8ffb6010657d4793f1d1e3f44244ef9')
sha512sums_aarch64=('2e9a8242972e0b119a63d4dac891eea96a661b06b0a05afe5f82c30457b2aca67a188ea5194e3f66dcd1bcdc625c41f9509b8ce584ca9730bb818b8a806d9648')

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
