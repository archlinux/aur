# Maintainer: Mohamed Hisham Abdelzaher <mohamed.hisham.abdelzaher@gmail.com>

pkgname=cagent-bin
pkgdesc="Docker cagent - Agent Builder and Runtime (prebuilt binary)"
pkgver=1.22.0 # renovate: datasource=github-tags depName=docker/cagent
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
sha256sums_x86_64=('342e7fbf332b76a3a1066bd0438c762b161075f85abff962ab10e8ecee8a9dda')
sha256sums_aarch64=('342e7fbf332b76a3a1066bd0438c762b161075f85abff962ab10e8ecee8a9dda')
noextract=('cagent')

package() {
  install -Dm755 "${srcdir}/cagent" "${pkgdir}/usr/bin/cagent"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
