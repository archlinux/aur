# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=ferrumc-bin
pkgver=0.1.0.rc2
pkgrel=1
pkgdesc="A reimplementation of the minecraft server in rust (precompiled binary)"
url="https://github.com/ferrumc-rs/ferrumc"
arch=("x86_64" "aarch64")
provides=("ferrumc")
conflicts=("ferrumc" "ferrumc-git")
license=("MIT")

source_x86_64=("ferrumc-bin-${pkgver}-x86_64.tar.gz::${url}/releases/download/v$(echo ${pkgver} | sed "s/\.\(rc\|beta\|alpha\)/-\1/")/ferrumc-v$(echo ${pkgver} | sed "s/\.\(rc\|beta\|alpha\)/-\1/")-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("ferrumc-bin-${pkgver}-aarch64.tar.gz::${url}/releases/download/v$(echo ${pkgver} | sed "s/\.\(rc\|beta\|alpha\)/-\1/")/ferrumc-v$(echo ${pkgver} | sed "s/\.\(rc\|beta\|alpha\)/-\1/")-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('e8f118eda99056536fb5f1c2de89b0691c4001d6b4c306b247972a3380a08d53')
sha256sums_aarch64=('4fb5da8af3a66f46ce273bd8caf6006f26758ef99bab742edd64612e57e2ac14')

package() {
  install -Dm755 "${srcdir}/ferrumc" "${pkgdir}/usr/bin/ferrumc"
}

