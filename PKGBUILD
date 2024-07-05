# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.7.0
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('6d17a190f18d3f60c321f7098e6b58bc2562756cf7f9f8c9979f9afbc7cd8a99');;
  aarch64)   _CARCH=arm64 && sha256sums=('37fa18269b47f968002595a3271a3ce6549bba0be7f69a1b5cc28dada2fb8058');;
  arm*)      _CARCH=arm   && sha256sums=('beed3f040a4eec05d72424d90ae648e61ee05f409c8836c10d5138caad110280');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
