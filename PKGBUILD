# Maintainer: Alejandro Ramirez <archlinux at got-root dot io>

pkgname=guard-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="Guard by AppsCode - Kubernetes Authentication WebHook Server"
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url="https://appscode.com/products/guard/"
license=('Apache')
provides=("guard" "guard-bin")

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('6807d3577828198ce30b9f88f0a6a1318f0153b2aba38ac26f44725f4b34f417');;
  aarch64) _CARCH=arm64 && sha256sums=('40caf49380d6f8267d6166bba38e032efcad3cba31c41c8002ed175b0c92e0d1');;
  arm*)    _CARCH=arm   && sha256sums=('8472b532e0eb0d7bbf85da80be97e6af3c5967530ae2dbafb6d7a89d902b1510');;
esac

source=("guard-${pkgver}-${_CARCH}.tar.gz"::"https://github.com/kubeguard/guard/releases/download/v${pkgver}/guard-linux-${_CARCH}.tar.gz")

package() {
  # Install executable.
  install -Dm755 "${srcdir}/guard-linux-${_CARCH}" "${pkgdir}/usr/bin/guard"
}
