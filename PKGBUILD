# Maintainer: Mikhail Kharitonovich <kharitonovich.m@gmail.com>

pkgname=i3langlayout
pkgver=0.1.0
pkgrel=1
pkgdesc="i3 language layout manager"
url="https://github.com/Minizinger/i3langlayout-rs"
license=('MIT')
source=('git+https://github.com/Minizinger/i3langlayout-rs.git')
sha256sums=('SKIP')
arch=('any')
makedepends=('cargo')

build(){
  cd i3langlayout-rs
  cargo build --release
}

package(){
  install -Dm755 "i3langlayout-rs/target/release/i3langlayout" "${pkgdir}/usr/bin/i3langlayout"
  install -D -m644 i3langlayout-rs/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p $HOME/.config/i3langlayout
  cp i3langlayout-rs/config-example.toml $HOME/.config/i3langlayout/config.toml
}

