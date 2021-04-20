# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=4.4.2
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('0c36ea50385b19a2eb22cd9032bf61aad9838ad8f59e0b6a21b4711bf46f39e4');;
  aarch64)   _CARCH=arm64 && sha256sums=('a519a825eaa4b8ac69edbe29aa82a9c0e68c1460149287b234c2deba1c9d64b7');;
  arm*)      _CARCH=arm   && sha256sums=('5fab5d7654ab3d23c0bbbcabdc6ccb887507cd994718c87e2aa1d869c10e8b00');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
