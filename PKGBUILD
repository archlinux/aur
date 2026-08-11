# Maintainer: Afroz Saqlain <sqn3680@gmail.com>
pkgname=papr-bin
_pkgname=papr
_crate_name=papr-tui
pkgver=0.1.1
pkgrel=1
pkgdesc="A keyboard-first terminal workspace for academic papers"
arch=("x86_64")
url="https://github.com/AfrozSaqlain/Papr"
license=("MIT")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_crate_name}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=("3213ed679a2356ac6896f0bd1a1d6ecb9b91015e226d55f1a5643d9865b634a4")

package() {
  find "${srcdir}" -type f -name "${_pkgname}" -exec install -Dm755 {} "${pkgdir}/usr/bin/${_pkgname}" \;
  find "${srcdir}" -type f -name "LICENSE*" -exec install -Dm644 {} "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE" \;
}
