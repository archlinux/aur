# Maintainer: Swaranga Sarma <sarma.swaranga@gmail.com>
pkgname=dloom-bin
_pkgname=dloom
pkgver=1.0.2
pkgrel=1
pkgdesc='Prebuilt binary release of dloom, a flexible dotfile symlink manager and system bootstrapper'
arch=('x86_64')
url='https://github.com/dloomorg/dloom'
license=('MIT')
provides=('dloom')
conflicts=('dloom')
source=(
  "${_pkgname}_v${pkgver}_linux_amd64.tar.gz::https://github.com/dloomorg/dloom/releases/download/v1.0.2/dloom_v1.0.2_linux_amd64.tar.gz"
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/dloomorg/dloom/archive/refs/tags/v1.0.2.tar.gz"
)
sha256sums=(
  '011432bbcc20057a9176d7ada94c89223dddb72c44efefca7254ee25fca0674c'
  '5d01c61d102dc91b2cbe472626d1cc495f605a66684f8587d6113dd66a8bd1ee'
)

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
