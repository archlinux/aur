# Maintainer: Michael Nussbaum <michaelnussbaum08@gmail.com>

pkgname=scie-pants-bin
pkgdesc="scie-pants is the Pants build tool launcher binary"
pkgver=0.12.5
pkgrel=1
arch=("x86_64" "aarch64")
url="https://github.com/pantsbuild/scie-pants"
license=("apache")
sha256sums=()
options=("!strip" "!debug")

case "${CARCH:=x86_64}" in
  x86_64)
    _pkgarch="x86_64"
    sha256sums+=("5c9d26c2c6e775a2a9ddcc1680b3849b1e09ab4af24b55b062bb8858d1138bc5")
    ;;
  aarch64)
    _pkgarch="aarch64"
    sha256sums+=("0b5a61887067256ffd28e634ad1c82998f6d6bc1d18a80c5a6b4c24b84c07a6c")
    ;;
esac

source=("https://github.com/pantsbuild/scie-pants/releases/download/v${pkgver}/scie-pants-linux-${_pkgarch}")

package() {
  install -D -m 0755 "scie-pants-linux-${_pkgarch}" "${pkgdir}/usr/bin/pants"
}
