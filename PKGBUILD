# Maintainer: Thomas Eizinger <thomas@eizinger.io>

# All my PKGBUILDs are managed at https://github.com/thomaseizinger/pkgbuilds

_gitname=dylint
pkgname=cargo-dylint
pkgver=1.0.2
pkgrel=0
pkgdesc="A tool for running Rust lints from dynamic libraries"
arch=('x86_64')
url="https://github.com/trailofbits/${_gitname}"
license=('MIT')
makedepends=('rust')
source=("https://github.com/trailofbits/${_gitname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f7bb9c7d687db520cb07910afdab056173a7bb9e6bf98e3de4265817a8bff80c')

build() {
  cd "$srcdir/${_gitname}-${pkgver}"

  cargo build --package ${pkgname} --release --target-dir=./target
}

package() {
  install -Dm755 "$srcdir/${_gitname}-${pkgver}/target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}
