# Maintainer: Siôn le Roux <sinisterstuf@gmail.com>
pkgname=img-bin
_pkgname=img-linux-amd64
_binname=img
pkgver=0.4.3
pkgrel=1
pkgdesc="Standalone, daemon-less, unprivileged Dockerfile and OCI compatible container image builder"
arch=('x86_64')
url="https://github.com/genuinetools/${_binname}"
license=('MIT')
groups=()
depends=('runc')
makedepends=()
provides=("${_binname}")
conflicts=("${_binname}")
replaces=("${_binname}")
backup=()
options=()
install=
source=(
  "https://github.com/genuinetools/${_binname}/releases/download/v${pkgver}/${_pkgname}"
  "https://raw.githubusercontent.com/genuinetools/${_binname}/master/LICENSE"
)
md5sums=(
  'b1dec09ce91d27c020a4c62bb511cf6f'
  '48ef0979a2bcc3fae14ff30b8a7f5dbf'
)

build() {
  # make binary executable
  chmod +x "${srcdir}/${_pkgname}"
}

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  cp "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_binname}"

  mkdir -p "${pkgdir}/usr/share/licenses/${_binname}"
  cp "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_binname}"
}

# vim:set ts=2 sw=2 et:
