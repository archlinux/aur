# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.5.2
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('bd0fac44fd5c6e6962b14d259a2e13229effb6625e4d433aaad6ff76ed2f07b9');;
  aarch64)   _CARCH=arm64 && sha256sums=('2456f2b7db892ae8fb33929543c0a9d672755b8f57b133ea32c83b3aae2f76d5');;
  arm*)      _CARCH=arm   && sha256sums=('1b538da69b324facdc4f9f5ccbe4a0005c2f9f82d221a14a1a421a564efdbd5c');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
