# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kftui
pkgname=$_pkgname-bin
pkgver=0.22.1 # renovate: datasource=github-releases depName=hcavarsan/kftray
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
sha512sums_x86_64=('4483976ebd9aa43dadf50d82ab5903c436a291480ba411d8fb5162eeb56efea06685e6fe00c8dcf035c8e0332542d9cfbfd8a666a82abcc4432dbb5fe3d2a7dd')
sha512sums_aarch64=('0cdbe3023c7e61a60d7345c9952f57a02cf1201cb0de48f79ac842a105d13aae1aaf779f23300d8e36665cf79ee48dfdac6495f89a1de2f7f43bd4049ab58352')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
