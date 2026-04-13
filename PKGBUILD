# Maintainer: Mohamed Hisham Abdelzaher <mohamed.hisham.abdelzaher@gmail.com>

pkgname=docker-sandbox-bin
pkgdesc="Docker Sandboxes run AI coding agents in isolated microVM sandboxes"
pkgver=0.25.0 # renovate: datasource=github-tags depName=docker/sbx-releases
pkgrel=1
arch=('x86_64')
url="https://github.com/docker/sbx-releases"
license=('custom:Proprietary')
provides=('sbx')
conflicts=('sbx')
source=("docker-sandbox::${url}/releases/download/v${pkgver}/DockerSandboxes-linux.tar.gz")
sha256sums=('f332583797cdc20afaa96ada53ac91530f57f076bc55d0ab0a59d94ba3214aef')

package() {
  install -Dm755 "${srcdir}/docker-sbx/sbx" "${pkgdir}/usr/bin/sbx"
  install -Dm644 "${srcdir}/docker-sbx/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
