# Maintainer: Borhaneddine GUEMIDI <guemidiborhane at gmail.com>

_pkgname="tufw"
pkgname="$_pkgname-bin"
pkgver=0.2.7
pkgrel=1
pkgdesc='Terminal UI for ufw'
url='https://github.com/peltho/tufw'
arch=('aarch64' 'i686' 'x86_64')
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('ufw')

source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")

sha256sums_aarch64=('95f9949505b6686297b5218f95fcfc5cfadaf46ae1dd74d5595d81877f3c8742')
sha256sums_i686=('352e1f4d1d055c69036d3659c7f7d0577b789228e3b9025d4251000cefa05471')
sha256sums_x86_64=('fba191536cc928b0482de67784a821d3f1af3f388a8df258c749ac36d5614f3f')

package() {
  install -Dm755 tufw "${pkgdir}/usr/bin/tufw"
  mkdir -p "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/"
}
