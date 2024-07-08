# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="autocast"
pkgname="${_pkgname}-bin"
pkgver=0.1.0
pkgrel=1
pkgdesc="A tool to help automate the creation of terminal demos"
arch=('x86_64')
url="https://github.com/k9withabone/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('c236e53dc51a1b01d74291e6ade778f23903cb30eded5d3e63bfb1c1f70d9336')

case "${CARCH}" in
  x86_64)
    _arch="x86_64"
    ;;
  *)
    echo "Unsupported architecture: ${CARCH}"
    exit 1
    ;;
esac

package() {
  cd "${srcdir}/${_pkgname}-${_arch}-unknown-linux-gnu"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
