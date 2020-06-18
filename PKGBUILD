# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname='rancher-k3d-beta-bin'
pkgver="3.0.0_rc.5"
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker. Pre-release Versions'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=('k3d')
conflicts=('rancher-k3d-bin')

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('66486f2c2a17dbd6d5daeb8ef42d15acb71cf40bb25da2f1ea9f87888b657f37');;
  aarch64)   _CARCH=arm64 && sha256sums=('518d822135a6a9b27ec3c0d1225d476770d4ea458a40b90ab66a6abbef4b389c');;
  arm*)      _CARCH=arm   && sha256sums=('7c7487e6795c2ac6135236aaf569ea95add0c2715994380c1e35bdf64e1e9bb9');;
esac

source=("${pkgname}-${pkgver}::https://github.com/rancher/k3d/releases/download/v${pkgver/_/-}/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver} "$pkgdir/usr/bin/k3d"
}
