# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=4.3.0
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('afb1a4b2df657c3721cc4034a381c05c3c7cc343198103157317d1e891f2ee7f');;
  aarch64)   _CARCH=arm64 && sha256sums=('4eb2e85411667acb6612552c6ac4115a78e588b22b48cdc02047b8398e0491e6');;
  arm*)      _CARCH=arm   && sha256sums=('23d68f3bd2b9a1305c82d064ca6656414dfe2956f77ea82e6c01578cd3d458e3');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
