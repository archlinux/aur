# Maintainer: Alejandro Ramirez <archlinux at got-root dot io>

pkgname=guard-bin
pkgver=0.15.1
pkgrel=1
pkgdesc="Guard by AppsCode - Kubernetes Authentication WebHook Server"
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url="https://appscode.com/products/guard/"
license=('Apache')
provides=("guard" "guard-bin")

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('bb93a5f695c93f24ff63861d8c12879e4fd00351d3909455672ada4223088768');;
  aarch64) _CARCH=arm64 && sha256sums=('f9b3f66b3610ba096467030e3d3cba2718a43241615a89c637935c4bc18ac057');;
  arm*)    _CARCH=arm   && sha256sums=('83e174ca3a68692b0388fca0a48e32a450d04b552ed91774496794051c65adf3');;
esac

source=("guard-${pkgver}-${_CARCH}.tar.gz"::"https://github.com/kubeguard/guard/releases/download/v${pkgver}/guard-linux-${_CARCH}.tar.gz")

package() {
  # Install executable.
  install -Dm755 "${srcdir}/guard-linux-${_CARCH}" "${pkgdir}/usr/bin/guard"
}
