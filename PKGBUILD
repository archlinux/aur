# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=4.4.4
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('6d4ac3d4c5b084f445980e427c5d3a75eefd2c39a22d028825c234c6c20d1e46');;
  aarch64)   _CARCH=arm64 && sha256sums=('79ce0b61123d7c8727d9eea2dc423cfe7bde55396bd7c16f8f9f00b7e500bc02');;
  arm*)      _CARCH=arm   && sha256sums=('4e8933f3529d08a60b36fe56f0d9fca1d686b02a5278d189d404a4b676697135');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
