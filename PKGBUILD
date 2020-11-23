# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=3.3.0
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('3f09facdb0511666ee379ee3beb3d92de53c379b84531c8e5e7ff1d2b9889a45');;
  aarch64)   _CARCH=arm64 && sha256sums=('97d4c6c5dd14b18baa5f68b5427022ce842e394df1510d0b9ed0075f42b1145f');;
  arm*)      _CARCH=arm   && sha256sums=('72bae0b090809356a84fb4ce317dd87b85278caffdcb622d3e219ed71ba0f088');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
