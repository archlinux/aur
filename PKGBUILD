# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=3.0.0
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('934ad7e08478fa6531b5e66e2153d2922b7db0224a8dc561146f474e7c3dcae8');;
  aarch64)   _CARCH=arm64 && sha256sums=('291794bef1af6bea8be2347d34f98ba95846f8c9ed3e63eab5af5b50e3e21b05');;
  arm*)      _CARCH=arm   && sha256sums=('b93de0bb52c3779c1aadd5a090d343ca39521b82a5137e5d2bd0c003293356b6');;
esac

source=("${pkgname}-${pkgver}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver} "$pkgdir/usr/bin/k3d"
}
