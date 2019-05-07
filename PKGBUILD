# Maintainer: duxet <duxetlg@gmail.com>

pkgname=k3s-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Lightweight Kubernetes"
url="https://k3s.io"
license=('Apache')
arch=('x86_64')
conflicts=('k3s-git')

source=(
  "k3s-${pkgver}::https://github.com/rancher/k3s/releases/download/v${pkgver}/k3s"
  "k3s.service"
)
sha256sums=(
  'b4dba47e1bac203a4e9bcbdf4e362e026ff5d312aa9bdef9a4220b88c47151cb'
  '859b2fcb894d27afa9f0feeff8067c1a3f71d2105ad7cdfefc6cf00166a2a59f'
)

package() {
  install -Dm 755 $srcdir/k3s-${pkgver} $pkgdir/usr/bin/k3s

  install -dm 755 $pkgdir/usr/lib/systemd/system
  install -m 644 $srcdir/k3s.service $pkgdir/usr/lib/systemd/system/k3s.service
}
