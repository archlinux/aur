# Maintainer: Mohamed Hisham Abdelzaher <mohamed.hisham.abdelzaher@gmail.com>

pkgname=docker-agent-bin
pkgdesc="AI Agent Builder and Runtime by Docker Engineering (prebuilt binary)"
pkgver=1.115.0 # renovate: datasource=github-tags depName=docker/docker-agent
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/docker/docker-agent"
license=('Apache-2.0')
provides=('docker-agent')
conflicts=('docker-agent')
source_x86_64=("docker-agent::https://github.com/docker/docker-agent/releases/download/v${pkgver}/docker-agent-linux-amd64")
source_aarch64=("docker-agent::https://github.com/docker/docker-agent/releases/download/v${pkgver}/docker-agent-linux-arm64")
source=("LICENSE::https://raw.githubusercontent.com/docker/docker-agent/v${pkgver}/LICENSE")
sha256sums=('58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd')
sha256sums_x86_64=('5f76bb1394254c21f2a92fe3797cd49ca476e1ee5e99f66255800c8ad92847b2')
sha256sums_aarch64=('5f76bb1394254c21f2a92fe3797cd49ca476e1ee5e99f66255800c8ad92847b2')
noextract=('docker-agent')

package() {
  install -Dm755 "${srcdir}/docker-agent" "${pkgdir}/usr/bin/docker-agent"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
