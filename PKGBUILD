# Maintainer: Max Gonzih <gonzih at gmail dot com>
pkgname=screensaver-off
pkgver=0.0.1
pkgrel=1
epoch=1
pkgdesc="Utility to disable screensaver"
arch=('i686' 'x86_64')
url="https://github.com/Gonzih/screensaver-off.rs"
license=('MIT')
depends=('gtk3')
makedepends=('cargo' 'rust' 'gcc')
optdepends=('weston: default terminal emulator'
            'dmenu: default launcher'
            'way-cooler-bg: draws a background for Way Cooler')
backup=('etc/way-cooler/init.lua')
source=("${pkgname}::git+https://github.com/Gonzih/screensaver-off.rs.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"

  mkdir -p "$pkgdir/usr/bin"
  mv "target/release/screensaver-off" "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
