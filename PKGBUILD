# Maintainer: Julie Shapiro <jshapiro at nvidia dot com>
# Maintainer: Kien Dang <mail at kien dot ai>

pkgname=nvidia-docker

pkgver=2.6.0
pkgrel=1

pkgdesc='Build and run Docker containers leveraging NVIDIA GPUs'
url='https://github.com/NVIDIA/nvidia-docker'
arch=(any)
license=(BSD)

depends=(docker 'nvidia-container-runtime>=3.5.0')

source=("https://github.com/NVIDIA/nvidia-docker/archive/v${pkgver}.tar.gz")
sha256sums=('a2f41b91770e45d3f7e6d361be720573a20e88ea33d4f8c7984b6b0cfdc57214')

package() {
  cd "${pkgname}-${pkgver}"

  install -D -m755 "nvidia-docker" "${pkgdir}/usr/bin/nvidia-docker"
  install -D -m644 "daemon.json" "${pkgdir}/etc/docker/daemon.json"
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
