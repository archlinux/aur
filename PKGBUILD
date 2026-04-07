# Maintainer: Mohamed Hisham Abdelzaher <mohamed.hisham.abdelzaher@gmail.com>

pkgname=docker-sandbox-bin
pkgdesc="Docker Sandboxes run AI coding agents in isolated microVM sandboxes"
pkgver=0.24.1 # renovate: datasource=github-tags depName=docker/sbx-releases
pkgrel=1
arch=('x86_64')
url="https://github.com/docker/sbx-releases"
license=('custom:Proprietary')
provides=('sbx')
conflicts=('sbx')
source=("docker-sandbox::${url}/releases/download/v${pkgver}/DockerSandboxes-linux.tar.gz")
sha256sums=('3a7e5514566bb472e24d2019dede7dc24520ad7fe0374626338b6acead003068')

package() {
  install -Dm755 "${srcdir}/docker-sbx/sbx" "${pkgdir}/usr/bin/sbx"
  install -Dm644 "${srcdir}/docker-sbx/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
