# Maintainer: duxet <duxetlg@gmail.com>

pkgname=k3s-bin
pkgver=0.1.0
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
  '6af58a878d0c8ed595c63d46884231ec2d66199ca2d06681218d062a5b8a0cbf'
  '859b2fcb894d27afa9f0feeff8067c1a3f71d2105ad7cdfefc6cf00166a2a59f'
)

package() {
  install -Dm 755 $srcdir/k3s-${pkgver} $pkgdir/usr/bin/k3s

  install -dm 755 $pkgdir/usr/lib/systemd/system
  install -m 644 $srcdir/k3s.service $pkgdir/usr/lib/systemd/system/k3s.service
}
