# Maintainer: Mohamed Hisham Abdelzaher <mohamed.hisham.abdelzaher@gmail.com>

pkgname=cagent-bin
pkgdesc="Docker cagent - Agent Builder and Runtime (prebuilt binary)"
pkgver=1.15.7 # renovate: datasource=github-tags depName=docker/cagent
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/docker/cagent"
license=('Apache-2.0')
provides=('cagent')
conflicts=('cagent')
source_x86_64=("cagent::https://github.com/docker/cagent/releases/download/v${pkgver}/cagent-linux-amd64")
source_aarch64=("cagent::https://github.com/docker/cagent/releases/download/v${pkgver}/cagent-linux-arm64")
source=("LICENSE::https://raw.githubusercontent.com/docker/cagent/v${pkgver}/LICENSE")
sha256sums=('58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd')
sha256sums_x86_64=('a6c85b0c5d6b62fd1056b6a568a4ded9bcf9c3b7f4f019d1bc4b9cdb1fda72a6')
sha256sums_aarch64=('a6c85b0c5d6b62fd1056b6a568a4ded9bcf9c3b7f4f019d1bc4b9cdb1fda72a6')
noextract=('cagent')

package() {
  install -Dm755 "${srcdir}/cagent" "${pkgdir}/usr/bin/cagent"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
