# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.5.1
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('4849027dc5e835bcce49070af3f4eeeaada81d96bce49a8b89904832a0c3c2c0');;
  aarch64)   _CARCH=arm64 && sha256sums=('4a3740fb2bc61fda32b2437c270a5f7dc321ade5e9cb6d932b4b97397538042d');;
  arm*)      _CARCH=arm   && sha256sums=('b882af7c10ed2321490676763fdcffebda134b44ae0a71741dc13abc4b8c7013');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
