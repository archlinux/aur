# Maintainer: Siôn le Roux <sinisterstuf@gmail.com>
pkgname=reg
_pkgname=reg-linux-amd64
pkgver=0.13.0
pkgrel=1
pkgdesc="Docker registry v2 command line client"
arch=('x86_64')
url="https://github.com/genuinetools/${pkgname}"
license=('MIT')
groups=()
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(
  "https://github.com/genuinetools/${pkgname}/releases/download/v${pkgver}/${_pkgname}"
  "https://raw.githubusercontent.com/genuinetools/${pkgname}/master/LICENSE"
)
md5sums=(
  '88b90e7d3d7ac99c880cf3c804440d15'
  '48ef0979a2bcc3fae14ff30b8a7f5dbf'
)

build() {
  # make binary executable
  chmod +x "${srcdir}/${_pkgname}"
}

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  cp "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
