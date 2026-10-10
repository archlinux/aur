# Maintainer: Pasha Finkelshtein <pavel.finkelshtein@gmail.com>
# Contributor: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.9.0
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

_src="${pkgname}-${pkgver}"
source_x86_64=("${_src}-x86_64::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-amd64")
source_aarch64=("${_src}-aarch64::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-arm64")
source_arm=("${_src}-arm::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-arm")
source_armv6h=("${_src}-armv6h::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-arm")
source_armv7h=("${_src}-armv7h::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-arm")
sha256sums_x86_64=('06d8f25bc3a971c4eb29e0ff08429b180402db0f4dec838c9eac427e296800a0')
sha256sums_aarch64=('03cde5cf23e6e8e67de5a039ecf26e5b85aca82fba3e5d13dadf904cd218a250')
sha256sums_arm=('3b8e5772f880a85b6620e7f1245070240c5338361e80ef2717cbf3bc021e23ca')
sha256sums_armv6h=('3b8e5772f880a85b6620e7f1245070240c5338361e80ef2717cbf3bc021e23ca')
sha256sums_armv7h=('3b8e5772f880a85b6620e7f1245070240c5338361e80ef2717cbf3bc021e23ca')

package() {
  install -Dm 0755 "${_src}-${CARCH}" "$pkgdir/usr/bin/k3d"
}
