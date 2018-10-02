# Maintainer: Siôn le Roux <sinisterstuf@gmail.com>
pkgname=img-bin
_pkgname=img-linux-amd64
_binname=img
pkgver=0.5.1
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
sha256sums=(
  '243a1185e296107009d2c4037186714a8747af27d7242439673b233372063684'
  'c696614021eafe355c7fb0af3e724fc7fa8729a0c10c27cbed2505bf30a853ce'
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
