# Maintainer: Alejandro Ramirez <archlinux at got-root dot io>

pkgname=guard-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Guard by AppsCode - Kubernetes Authentication WebHook Server"
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url="https://appscode.com/products/guard/"
license=('Apache')
provides=("guard" "guard-bin")

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('83f57233057c7fed0de56f92807be477b421a8f3893486913253749b532dde4c');;
  arm*)    _CARCH=arm   && sha256sums=('43ef135fea6e3b0bb05a12effe5eab87dd4dce2eb1a633ea33c00c3a320ca51c');;
  aarch64) _CARCH=arm64 && sha256sums=('4cca64e986b1638a22857df35f694b206cd846f260c7e3ddb4c1f99bb383d872');;
esac

source=("guard-${pkgver}-${_CARCH}.tar.gz"::"https://github.com/kubeguard/guard/releases/download/v${pkgver}/guard-linux-${_CARCH}.tar.gz")

package() {
  # Install executable.
  install -Dm755 "${srcdir}/guard-linux-${_CARCH}" "${pkgdir}/usr/bin/guard"
}
