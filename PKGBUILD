# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.7.1
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('24441b1ed9796f519e3fdaa9f076df1a92fd7b38c90d68717b1cdd0915ba6673');;
  aarch64)   _CARCH=arm64 && sha256sums=('12320bd26fbce2e9314934a6be688274ca9f138227a5f5fb6830538ab4f8b567');;
  arm*)      _CARCH=arm   && sha256sums=('7ec9a4fdcdcbdf6e676eff112bc27d4c618c9c88ccc6cb0ed07b969b4cb5f382');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
