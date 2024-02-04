# Maintainer: Michael Nussbaum <michaelnussbaum08@gmail.com>

pkgname=scie-pants-bin
pkgdesc="scie-pants is the Pants build tool launcher binary"
pkgver=0.10.6
pkgrel=1
arch=("x86_64" "aarch64")
url="https://github.com/pantsbuild/scie-pants"
license=("apache")
sha256sums=()
options=("!strip")

case "${CARCH:=x86_64}" in
  x86_64)
    _pkgarch="x86_64"
    sha256sums+=("ad88bc2331464a9c8cea99eb72fd5de73b652c9defeec92fdd3f3c312e4ed009")
    ;;
  aarch64)
    _pkgarch="aarch64"
    sha256sums+=("4624ddd8b8589e21fd6dac576ee44a38144e12c339788c618137785871210d2f")
    ;;
esac

source=("https://github.com/pantsbuild/scie-pants/releases/download/v${pkgver}/scie-pants-linux-${_pkgarch}")

package() {
  install -D --debug -m 0755 "scie-pants-linux-${_pkgarch}" "${pkgdir}/usr/bin/pants"
}
