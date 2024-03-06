# Maintainer: Michael Nussbaum <michaelnussbaum08@gmail.com>

pkgname=scie-pants-bin
pkgdesc="scie-pants is the Pants build tool launcher binary"
pkgver=0.10.7
pkgrel=1
arch=("x86_64" "aarch64")
url="https://github.com/pantsbuild/scie-pants"
license=("apache")
sha256sums=()
options=("!strip")

case "${CARCH:=x86_64}" in
  x86_64)
    _pkgarch="x86_64"
    sha256sums+=("952de8780c86cadb6ac6057a7e1b4d58f739dfea6b2d4f35ffe2d1eb8fc3df06")
    ;;
  aarch64)
    _pkgarch="aarch64"
    sha256sums+=("4610d25bac9e385df7800d5cc54f2a1672de2ed5396ec0e9d04f481cd6667eaa")
    ;;
esac

source=("https://github.com/pantsbuild/scie-pants/releases/download/v${pkgver}/scie-pants-linux-${_pkgarch}")

package() {
  install -D --debug -m 0755 "scie-pants-linux-${_pkgarch}" "${pkgdir}/usr/bin/pants"
}
