# Maintainer: Mohamed Hisham Abdelzaher <mohamed.hisham.abdelzaher@gmail.com>

pkgname=docker-sandbox-bin
pkgdesc="Docker Sandboxes run AI coding agents in isolated microVM sandboxes"
pkgver=0.31.2 # renovate: datasource=github-tags depName=docker/sbx-releases
pkgrel=1
arch=('x86_64')
url="https://github.com/docker/sbx-releases"
license=('custom:Proprietary')
provides=('sbx')
conflicts=('sbx')
source=("docker-sandbox::${url}/releases/download/v${pkgver}/DockerSandboxes-linux.tar.gz")
sha256sums=('9054388caa4e71c4f4a32ad06f342df8a034269f4bbedf1c0d5b76f0a91576e6')

package() {
  install -Dm755 "${srcdir}/docker-sbx/sbx" "${pkgdir}/usr/bin/sbx"
  install -Dm644 "${srcdir}/docker-sbx/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
