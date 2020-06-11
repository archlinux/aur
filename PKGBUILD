# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=1.7.0
pkgrel=3
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('da9ff31bcf4377fadfb065f4998d347f19de1168a5a553ce2c23b763ee1f6098');;
  aarch64)   _CARCH=arm64 && sha256sums=('2d08ee5434fa6a9f6d8abf420cb3ebb075af320262ecbac82175e33442163587');;
  arm*)      _CARCH=arm   && sha256sums=('d922dc3c6df0cb9c7a92a3d1f1a96efd4126208596b06f522d6270289dcfadd5');;
esac

source=("${pkgname}-${pkgver}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver} "$pkgdir/usr/bin/k3d"
}
