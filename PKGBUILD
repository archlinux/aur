# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

_pkgname='undock'
pkgname="${_pkgname}-bin"
pkgver=0.10.0
pkgrel=1
pkgdesc='Extract contents of a container image in a local folder'
arch=('x86_64' 'aarch64')
url='https://github.com/crazy-max/undock'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('e21b8f5fe55ad4914210b1706aa442ba8e12b5d8bcd46e2f5b4837993dbaea58')
sha256sums_aarch64=('cc0a0635b859ad0b619e33635f066132dbb661ac4bc73ef13042c6ef466b4cf5')
options=("!strip")

package() {
  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 "CHANGELOG.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

