# Maintainer: Julie Shapiro <jshapiro at nvidia dot com>
# Maintainer: Kien Dang <mail at kien dot ai>

pkgname=nvidia-docker

pkgver=2.10.0
pkgrel=1

pkgdesc='Build and run Docker containers leveraging NVIDIA GPUs'
url='https://github.com/NVIDIA/nvidia-docker'
arch=(any)
license=(BSD)

depends=(docker 'nvidia-container-runtime>=3.9.0' 'nvidia-container-toolkit>=1.9.0')

source=("https://github.com/NVIDIA/nvidia-docker/archive/v${pkgver}.tar.gz")
sha256sums=('1b0050c500a0d728824ea0e6abcd2d8612097e7b7031f3b2fdf587c2bc2843a8')

package() {
  cd "${pkgname}-${pkgver}"

  install -D -m755 "nvidia-docker" "${pkgdir}/usr/bin/nvidia-docker"
  install -D -m644 "daemon.json" "${pkgdir}/etc/docker/daemon.json"
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
