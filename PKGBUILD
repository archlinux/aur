# Maintainer: duxet <duxetlg@gmail.com>

pkgname=k3s-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Lightweight Kubernetes"
url="https://k3s.io"
license=('Apache')
arch=('x86_64')

source=(
  "k3s-${pkgver}::https://github.com/rancher/k3s/releases/download/v${pkgver}/k3s"
  "k3s.service"
)
sha256sums=(
  'a77f1830856ea4fb136f22cc930ab2eaf7635c1563089932630b4d2521a9fe31'
  '859b2fcb894d27afa9f0feeff8067c1a3f71d2105ad7cdfefc6cf00166a2a59f'
)

package() {
  install -Dm 755 $srcdir/k3s-${pkgver} $pkgdir/usr/bin/k3s

  install -dm 755 $pkgdir/usr/lib/systemd/system
  install -m 644 $srcdir/k3s.service $pkgdir/usr/lib/systemd/system/k3s.service
}
