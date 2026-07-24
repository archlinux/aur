# Maintainer: Mohamed Hisham Abdelzaher <mohamed.hisham.abdelzaher@gmail.com>

pkgname=docker-sandbox-bin
pkgdesc="Docker Sandboxes run AI coding agents in isolated microVM sandboxes"
pkgver=0.37.0 # renovate: datasource=github-tags depName=docker/sbx-releases
pkgrel=1
arch=('x86_64')
url="https://github.com/docker/sbx-releases"
license=('custom:Proprietary')
provides=('sbx')
conflicts=('sbx')
source=("docker-sandbox::${url}/releases/download/v${pkgver}/DockerSandboxes-linux.tar.gz")
sha256sums=('770abf7f91b13aba86cc7bb7d548b8e07c812d5a109321905e7b7da0ad07d998')

package() {
  install -Dm755 "${srcdir}/docker-sbx/sbx" "${pkgdir}/usr/bin/sbx"
  install -Dm644 "${srcdir}/docker-sbx/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
