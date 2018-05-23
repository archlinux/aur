# Maintainer: Ivan Semkin (ivan at semkin dot ru)

pkgname=nvidia-docker
pkgver=2.0.3
pkgrel=2
pkgdesc='Build and run Docker containers leveraging NVIDIA GPUs'
arch=(x86_64)
url='https://github.com/NVIDIA/nvidia-docker'
license=(custom)
depends=(docker nvidia-container-runtime nvidia-container-runtime-hook)

source=("https://github.com/NVIDIA/nvidia-docker/blob/gh-pages/centos7/x86_64/nvidia-docker2-$pkgver-1.docker18.03.1.ce.noarch.rpm?raw=true")
sha256sums=('e07186b8e503ab4a170631714226cb6fc9992534f3ddcb226f7d9a186e832633')

package() { 
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/etc/docker"
  
  install -m755 "${srcdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -m644 "${srcdir}/etc/docker/daemon.json" "${pkgdir}/etc/docker/daemon.json"
}
# vim:set ts=2 sw=2 et:
