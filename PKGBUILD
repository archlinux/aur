# Maintainer: Swaranga Sarma <sarma.swaranga@gmail.com>
pkgname=dloom-bin
_pkgname=dloom
pkgver=1.0.1
pkgrel=1
pkgdesc='Prebuilt binary release of dloom, a flexible dotfile symlink manager and system bootstrapper'
arch=('x86_64')
url='https://github.com/dloomorg/dloom'
license=('MIT')
provides=('dloom')
conflicts=('dloom')
source=(
  "${_pkgname}_v${pkgver}_linux_amd64.tar.gz::https://github.com/dloomorg/dloom/releases/download/v1.0.1/dloom_v1.0.1_linux_amd64.tar.gz"
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/dloomorg/dloom/archive/refs/tags/v1.0.1.tar.gz"
)
sha256sums=(
  'd1cdf2063c6fa889cdce46863a3e0a9a685133eeff592e52697631a46a0a5c98'
  '3edc665197a871ebb59b2971f7e8e73a245f13b49e7a3e992e949aeccc893afe'
)

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
