# shellcheck shell=bash
# AUR Maintainer: Shadichy <shadichy@blisslabs.org>
# This is a Rust package

pkgname=modloader
pkgver=2.0.0
pkgrel=1
pkgdesc="An alternative to modprobe with probing for non-exported symbols. Taken from KernelSU source code."
arch=('x86_64' 'aarch64')
url="https://github.com/shadichy/modloader"
license=('GPL-2.0-only')
makedepends=('git' 'rust' 'cargo')
options=('!strip' '!emptydirs')

source=("${pkgname}::git+${url}")
sha256sums=(SKIP)

build() {
  cd "${pkgname}"
  cargo build --release
}

package() {
  cd "${pkgname}"
  install -Dm755 target/release/modloader "${pkgdir}/usr/bin/modloader"
}
