# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

_pkgname='undock'
pkgname="${_pkgname}-bin"
pkgver=0.14.0
pkgrel=1
pkgdesc='Extract contents of a container image in a local folder'
arch=('x86_64' 'aarch64')
url='https://github.com/crazy-max/undock'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('25d99376c951c849cbba65a27cc186c03ae1a2792284040018cbb786e359edf6')
sha256sums_aarch64=('84a2d6db94169c2d9e903ae4b31d7e554a26ae0626534cba8419a747f239ccf8')
options=("!strip")

package() {
  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 "CHANGELOG.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

