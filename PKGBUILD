# Maintainer: Michael Nussbaum <michaelnussbaum08@gmail.com>

pkgname=scie-pants-bin
pkgdesc="scie-pants is the Pants build tool launcher binary"
pkgver=0.12.0
pkgrel=1
arch=("x86_64" "aarch64")
url="https://github.com/pantsbuild/scie-pants"
license=("apache")
sha256sums=()
options=("!strip" "!debug")

case "${CARCH:=x86_64}" in
  x86_64)
    _pkgarch="x86_64"
    sha256sums+=("f4f8e0a1b9ddc55a834d81adc351c44abb73c331f6a84f73170476eb1b7066b3")
    ;;
  aarch64)
    _pkgarch="aarch64"
    sha256sums+=("1eed6f2a54feeea16f359ced3cd16d95632bb5e278524df371034954e0fda461")
    ;;
esac

source=("https://github.com/pantsbuild/scie-pants/releases/download/v${pkgver}/scie-pants-linux-${_pkgarch}")

package() {
  install -D -m 0755 "scie-pants-linux-${_pkgarch}" "${pkgdir}/usr/bin/pants"
}
