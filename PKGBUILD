# Maintainer: Swaranga Sarma <sarma.swaranga@gmail.com>
pkgname=dloom-bin
_pkgname=dloom
pkgver=1.0.3
pkgrel=1
pkgdesc='Prebuilt binary release of dloom, a flexible dotfile symlink manager and system bootstrapper'
arch=('x86_64')
url='https://github.com/dloomorg/dloom'
license=('MIT')
provides=('dloom')
conflicts=('dloom')
source=(
  "${_pkgname}_v${pkgver}_linux_amd64.tar.gz::https://github.com/dloomorg/dloom/releases/download/v1.0.3/dloom_v1.0.3_linux_amd64.tar.gz"
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/dloomorg/dloom/archive/refs/tags/v1.0.3.tar.gz"
)
sha256sums=(
  '806ee9e7713e30ad1a6313e881b4c2b43858d0a6bfcbc0c4c6591032b0b26654'
  '75035d1f5eb1de02a8242fc7a259099be47ac8703a654a11c9b6ce4d3131c2e5'
)

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
