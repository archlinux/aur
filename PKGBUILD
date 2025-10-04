# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kftui
pkgname=$_pkgname-bin
pkgver=0.26.7 # renovate: datasource=github-releases depName=hcavarsan/kftray
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
sha512sums_x86_64=('f7967dd879d1d60520eab836dd23a4092e944ee3f9adea6377119f5381560ec0151ea3c63fa27c8fcf4dd4dd1682df0347b6c25a0ce1267e138253609d53c4fa')
sha512sums_aarch64=('2c103319bcf41324bfc7c1287d8e3401486d4533cba99de03b2f0318f71033baa569919fb46a55276e4defcf9cb1bc498364a3f499ec4f486b97b6f3dc63ba0a')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
