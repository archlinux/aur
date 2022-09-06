# Maintainer: Constantine Fedotov <zenflak@gmail.com>
# Contributor: Thomas Eizinger <thomas@eizinger.io>

# All Thomas PKGBUILDs are managed at https://github.com/thomaseizinger/pkgbuilds

_gitname=dylint
pkgname=cargo-dylint
pkgver=2.0.12
pkgrel=0
pkgdesc="A tool for running Rust lints from dynamic libraries"
arch=('x86_64')
url="https://github.com/trailofbits/${_gitname}"
license=('MIT')
makedepends=('rust')
source=("https://github.com/trailofbits/${_gitname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e408ed0f6bb42f371d79a2807a3c9f8d1661238e7309b6325f4a235691460711')

build() {
  cd "$srcdir/${_gitname}-${pkgver}"

  cargo build --package ${pkgname} --release --target-dir=./target
}

package() {
  install -Dm755 "$srcdir/${_gitname}-${pkgver}/target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}
