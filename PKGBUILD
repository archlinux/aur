# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=3.1.1
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('7c431828499c6ddc0ec709ff88f7606d6afe2509d135826b57fa24a4a9210e94');;
  aarch64)   _CARCH=arm64 && sha256sums=('815d69ee63e73b74b5b93444c7c8b88135f5c6446639e9de1b10317c7421bab7');;
  arm*)      _CARCH=arm   && sha256sums=('f4fa61c27d95a4d3c6aa94daf8e5fff5ce5e551dddd19728e127d08a59e73858');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
