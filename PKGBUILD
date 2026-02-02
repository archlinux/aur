# Maintainer: Mohamed Hisham Abdelzaher <mohamed.hisham.abdelzaher@gmail.com>

pkgname=cagent-bin
pkgdesc="Docker cagent - Agent Builder and Runtime (prebuilt binary)"
pkgver=1.20.1 # renovate: datasource=github-tags depName=docker/cagent
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
sha256sums_x86_64=('877968e210ae28fc11628e5b0350a530b30a7d17390288b20b80690a8e587d45')
sha256sums_aarch64=('877968e210ae28fc11628e5b0350a530b30a7d17390288b20b80690a8e587d45')
noextract=('cagent')

package() {
  install -Dm755 "${srcdir}/cagent" "${pkgdir}/usr/bin/cagent"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
