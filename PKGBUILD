# Maintainer: Alejandro Ramirez <archlinux at got-root dot io>

pkgname=guard-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="Guard by AppsCode - Kubernetes Authentication WebHook Server"
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url="https://appscode.com/products/guard/"
license=('Apache')
provides=("guard" "guard-bin")

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('267583477e7b036ec5c13989e44203c534a1f4cea250311614747352b29f5aab');;
  aarch64) _CARCH=arm64 && sha256sums=('ea101b1600461f0570cedbe1f113cfffdfc097a8ba6cea557584b74032002ff1');;
  arm*)    _CARCH=arm   && sha256sums=('ca88ae6e118bd2dd4b19fdd9269d34df24d54c43abd275a18e552f2c5ae0683a');;
esac

source=("guard-${pkgver}-${_CARCH}.tar.gz"::"https://github.com/kubeguard/guard/releases/download/v${pkgver}/guard-linux-${_CARCH}.tar.gz")

package() {
  # Install executable.
  install -Dm755 "${srcdir}/guard-linux-${_CARCH}" "${pkgdir}/usr/bin/guard"
}
