# Maintainer: Joel Shapiro <jshapiro at nvidia dot com>
# Maintainer: Kien Dang <mail at kien dot ai>

pkgname=nvidia-docker

pkgver=2.0.3
pkgrel=5

_actual_pkgver=2.1.1  # tool's internal version hasn't bumped for some reason

pkgdesc='Build and run Docker containers leveraging NVIDIA GPUs'
url='https://github.com/NVIDIA/nvidia-docker'
arch=(any)
license=(BSD)

depends=(docker nvidia-container-runtime)

source=("https://github.com/NVIDIA/nvidia-docker/archive/v$_actual_pkgver.tar.gz")
sha256sums=('09aa48c3eb6be71fae66e0f2e966aaf85ddf24102a51edc5234f9e60a39d3815')

package() {
  cd "${pkgname}-${_actual_pkgver}"

  install -D -m755 "nvidia-docker" "${pkgdir}/usr/bin/nvidia-docker"
  install -D -m644 "daemon.json" "${pkgdir}/etc/docker/daemon.json"
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
