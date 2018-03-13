# Maintainer: Siôn le Roux <sinisterstuf@gmail.com>
pkgname=img
_pkgname=img-linux-amd64
pkgver=0.3.0
pkgrel=1
pkgdesc="Standalone, daemon-less, unprivileged Dockerfile and OCI compatible container image builder"
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
  '13f503ce935641c9b485767981887433'
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
