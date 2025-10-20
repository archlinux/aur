# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kftui
pkgname=$_pkgname-bin
pkgver=0.27.0 # renovate: datasource=github-releases depName=hcavarsan/kftray
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
sha512sums_x86_64=('ac5e55a72ad4ee599766ef5096955431fe56ae1fb964d20c7764c0c36ff790b19a3c2d13323eb099d9217e3c7ce1ecbcfd2108e3590a2c0d1616789c7701c7b4')
sha512sums_aarch64=('1d58c02bc60babbe4ed51566dc6812366d03155d79516f0695becf9754b87009655c65c7e195e735402c43b2db05b6c9c4f22465125e0e62a5549e40998d3df1')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
