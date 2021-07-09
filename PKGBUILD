# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=4.4.7
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('51731ffb2938c32c86b2de817c7fbec8a8b05a55f2e4ab229ba094f5740a0f60');;
  aarch64)   _CARCH=arm64 && sha256sums=('0c6923d4ca57d1db31f764d3eaf2a6e488b62fb96795d4d4b522a445245b3e01');;
  arm*)      _CARCH=arm   && sha256sums=('3c1cad46dea4dda4fe19fc2d862e5e97c12f4d129528a67507539f2ea0f65649');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
