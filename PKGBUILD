# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname='rancher-k3d-beta-bin'
pkgver="3.0.0_rc.2"
pkgrel=2
pkgdesc='Little helper to run Rancher Labs k3s in Docker. Pre-release Versions'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=('k3d')
conflicts=('rancher-k3d-bin')

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('e37adffe15ff67c5ed5518a295a198d008363ffe546726686856807b2dcf5860');;
  aarch64)   _CARCH=arm64 && sha256sums=('c24254d2097741b08aed3a1b09ee79b9e13b0dd8d4300c098e45302ca9fecac1');;
  arm*)      _CARCH=arm   && sha256sums=('5556371d31a111a096b57b6c091b2a4300d0f00dc20fa6153e266cff44106a6b');;
esac

source=("${pkgname}-${pkgver}::https://github.com/rancher/k3d/releases/download/v${pkgver/_/-}/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver} "$pkgdir/usr/bin/k3d"
}
