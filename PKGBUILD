# Maintainer: Constantine Fedotov <zenflak@gmail.com>
# Contributor: Thomas Eizinger <thomas@eizinger.io>

# All Thomas PKGBUILDs are managed at https://github.com/thomaseizinger/pkgbuilds

_gitname=dylint
pkgname=cargo-dylint
pkgver=2.0.7
pkgrel=0
pkgdesc="A tool for running Rust lints from dynamic libraries"
arch=('x86_64')
url="https://github.com/trailofbits/${_gitname}"
license=('MIT')
makedepends=('rust')
source=("https://github.com/trailofbits/${_gitname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('96969af4de8afcd49fd284ec55cb438604b06b00c7961a77035a527f3fc742cd')

build() {
  cd "$srcdir/${_gitname}-${pkgver}"

  cargo build --package ${pkgname} --release --target-dir=./target
}

package() {
  install -Dm755 "$srcdir/${_gitname}-${pkgver}/target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}
