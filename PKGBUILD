# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.6.3
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('69f434b5a326eddafff6062a1b439d1c7a78a1ee93a91a9f79872cf8e516327d');;
  aarch64)   _CARCH=arm64 && sha256sums=('5d2e556e26681474a4aa09b40e2e9880084e0caf63a049b045cb22cc3188de68');;
  arm*)      _CARCH=arm   && sha256sums=('4133b1beaca09a07e4ffd42a45a3e314465ea27d1ca3cbc4eb15ea2785b79fa7');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
