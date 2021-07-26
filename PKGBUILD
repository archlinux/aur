# Maintainer: Thomas Eizinger <thomas@eizinger.io>

# All my PKGBUILDs are managed at https://github.com/thomaseizinger/pkgbuilds

_gitname=dylint
pkgname=cargo-dylint
pkgver=1.0.1
pkgrel=0
pkgdesc="A tool for running Rust lints from dynamic libraries"
arch=('x86_64')
url="https://github.com/trailofbits/${_gitname}"
license=('MIT')
makedepends=('rust')
source=("https://github.com/trailofbits/${_gitname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c50a7a300ba1bc100060bd7c9d42b24ba54d8ad1930c4198ab77b6fdffce8ee4')

build() {
  cd "$srcdir/${_gitname}-${pkgver}"

  cargo build --package ${pkgname} --release --target-dir=./target
}

package() {
  install -Dm755 "$srcdir/${_gitname}-${pkgver}/target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}
