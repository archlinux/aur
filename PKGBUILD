# Maintainer: Alejandro Ramirez <archlinux at got-root dot io>

pkgname=guard-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Guard by AppsCode - Kubernetes Authentication WebHook Server"
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url="https://appscode.com/products/guard/"
license=('Apache')
provides=("guard" "guard-bin")

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('a3b84a6fc736f724b364be4a3a666786792d39a4b36796cc840e8fda2bf071b0');;
  aarch64) _CARCH=arm64 && sha256sums=('4a56c37c1e2d3d6c824543629357f392dbb825557ae988c424e8a356eaf5c048');;
  arm*)    _CARCH=arm   && sha256sums=('9251cdcc57ccd2458e5a6d94af0b6f5dfa3f99a224847608dc8e3f33ea4b86fd');;
esac

source=("guard-${pkgver}-${_CARCH}.tar.gz"::"https://github.com/kubeguard/guard/releases/download/v${pkgver}/guard-linux-${_CARCH}.tar.gz")

package() {
  # Install executable.
  install -Dm755 "${srcdir}/guard-linux-${_CARCH}" "${pkgdir}/usr/bin/guard"
}
