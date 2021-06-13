# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=4.4.5
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('a3a380b918e619b8bb5dcc2acb44b196e2bb772bc0db8e9423c50f6ee5284552');;
  aarch64)   _CARCH=arm64 && sha256sums=('4967f3a9a58ebce67fdf6f60a8a0eeba60f43a9789dc0fa927be91b7c8688f19');;
  arm*)      _CARCH=arm   && sha256sums=('6ebd392415c36c7ade3f2ede12872ee65c4a45d8d62c986e4ca94602a725d176');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
