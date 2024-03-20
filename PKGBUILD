# Maintainer: Michael Nussbaum <michaelnussbaum08@gmail.com>

pkgname=scie-pants-bin
pkgdesc="scie-pants is the Pants build tool launcher binary"
pkgver=0.11.0
pkgrel=1
arch=("x86_64" "aarch64")
url="https://github.com/pantsbuild/scie-pants"
license=("apache")
sha256sums=()
options=("!strip" "!debug")

case "${CARCH:=x86_64}" in
  x86_64)
    _pkgarch="x86_64"
    sha256sums+=("89f3f98234dd2cc5f255229d6baa4f04d35c9c9674822baa8a414193b7178072")
    ;;
  aarch64)
    _pkgarch="aarch64"
    sha256sums+=("c5f5c58e1330b938fade75cb122fa262ba25b641a8653fedaeaf9d54c04f8caf")
    ;;
esac

source=("https://github.com/pantsbuild/scie-pants/releases/download/v${pkgver}/scie-pants-linux-${_pkgarch}")

package() {
  install -D -m 0755 "scie-pants-linux-${_pkgarch}" "${pkgdir}/usr/bin/pants"
}
