# Maintainer: duxet <duxetlg@gmail.com>

pkgname=k3s-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="Lightweight Kubernetes"
url="https://k3s.io"
license=('Apache')
arch=('x86_64' 'armv7h')
conflicts=('k3s-git')

source=(
  "k3s-${pkgver}-x86_64::https://github.com/rancher/k3s/releases/download/v${pkgver}/k3s"
  "k3s.service"
)

source_armv7h=(
  "k3s-${pkgver}-armv7h::https://github.com/rancher/k3s/releases/download/v${pkgver}/k3s-armhf"
  "k3s.service"
)

sha256sums=('154c18c8b123e21177e1c41c17044f6525cb0a4700c886cae428fb182c7482e4'
            '34a7f893878c5f72dfc7f89fafde5936f5813179b24f0a7e74f385b024d31d6c')
sha256sums_armv7h=('8d7ad36a4c3b6e016a3b665647629750afbacc27fdd8250ec209d04acd9339cc'
                   '34a7f893878c5f72dfc7f89fafde5936f5813179b24f0a7e74f385b024d31d6c')


package() {
  install -Dm 755 $srcdir/k3s-${pkgver}-${CARCH} $pkgdir/usr/bin/k3s

  install -dm 755 $pkgdir/usr/lib/systemd/system
  install -m 644 $srcdir/k3s.service $pkgdir/usr/lib/systemd/system/k3s.service
}
