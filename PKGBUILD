# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

_commit=v0.11.0
pkgname=i3status-rust
pkgver=0.11.0
pkgrel=1
pkgdesc='Resourcefriendly and feature-rich replacement for i3status, written in pure Rust'
arch=('x86_64')
url=https://github.com/greshake/i3status-rust
license=('GPL3')
depends=('dbus')
makedepends=('rust')
optdepends=('alsa-utils: for the volume block'
            'lm_sensors: for the temperature block'
            'powerline-fonts: for all themes using the Powerline arrow char'
            'speedtest-cli: for the speedtest block'
            'ttf-font-awesome: for the Awesome icons')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('343bec093b69f3966d2b342f30a1595bf443146afdeb03f70e60dbea352b1093fd1b917c7a2eb882c1ded7137dc32f8f7baa82d57372cd281fcc46ca7f247f91')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/i3status-rs
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname/examples example_*.toml
}

# vim:set ts=2 sw=2 et:
