# Maintainer: Michael Nussbaum <michaelnussbaum08@gmail.com>

pkgname=scie-pants-bin
pkgdesc="scie-pants is the Pants build tool launcher binary"
pkgver=0.13.2
pkgrel=1
arch=("x86_64" "aarch64")
url="https://github.com/pantsbuild/scie-pants"
license=("apache")
sha256sums=()
options=("!strip" "!debug")

case "${CARCH:=x86_64}" in
  x86_64)
    _pkgarch="x86_64"
    sha256sums+=("74a1e53bc50d6ef6ce1bc67bd9f7b48e549505e0a2453ad4d5ccbc72b0bea874")
    ;;
  aarch64)
    _pkgarch="aarch64"
    sha256sums+=("b40b60e50e9cb69e13029e100be995fbfdb3b3799ef1ccff60a81177f78e6b82")
    ;;
esac

source=("scie-pants-linux-${_pkgarch}-${pkgver}::https://github.com/pantsbuild/scie-pants/releases/download/v${pkgver}/scie-pants-linux-${_pkgarch}")

package() {
  install -D -m 0755 "scie-pants-linux-${_pkgarch}-${pkgver}" "${pkgdir}/usr/bin/pants"
}
