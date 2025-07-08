# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kftui
pkgname=$_pkgname-bin
pkgver=0.19.0 # renovate: datasource=github-releases depName=hcavarsan/kftray
pkgrel=1
pkgdesc="🦀 ⚡ kubectl port forward manager, with support for UDP and proxy connections through k8s clusters"
url="https://github.com/hcavarsan/kftray"
license=('GPL-3.0-only')
source_x86_64=(
  "$_pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/${_pkgname}_linux_amd64"
)
source_aarch64=(
  "$_pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/${_pkgname}_linux_arm64"
)
arch=('x86_64' 'aarch64')
sha512sums_x86_64=('30cfc5e3b2a669f2bb94e327d3effd33238d888dc4c66a6a58e0d7bbf2c9a5accd395950dff0e0a3d5e2fe1c31e518023f709e2444fd369777c97ff994d7bf09')
sha512sums_aarch64=('7dac186a0c199d223ca4358da8c7449869d4e40949fe5085e7623378a7c6d1ac4edb1f0ccc026d4d5f2a2b2a4a1a128a1e5b19b7cc1b00b03a2e1331df07e266')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
