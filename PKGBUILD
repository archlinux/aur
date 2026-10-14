# Maintainer: zaidejjo <zaid@ejjo.me>
# Contributor: zaidejjo <zaid@ejjo.me>
# shellcheck shell=bash

pkgname=zgit-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A modern, fast Git & GitHub client — TUI binary"
arch=('x86_64')
url="https://github.com/zaidejjo/zgit"
license=('Apache')
depends=('git' 'glibc')
makedepends=()
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${url}/releases/download/v${pkgver}/zgit-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('0b007920f4206904965e1a57d55a6c611941ac2d9dc81f437b213ddc50e95cae')

package() {
  # GoReleaser archives place the binary at the tarball root (no parent dir).
  install -Dm755 "zgit" "${pkgdir}/usr/bin/zgit"
}

# vim:set ts=2 sw=2 et:
