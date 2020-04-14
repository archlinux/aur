# Maintainer: Devin Pohl <pohl.devin@gmail.com>

pkgname=smatrix
pkgver=1.1.1
pkgrel=2
pkgdesc="'The Matrix' command-line wallpaper, but it's stock prices"
arch=('any')
url="https://github.com/Shizcow/smatrix"
license=('GPL2')
depends=('ncurses' 'curl')
makedepends=('rust' 'git')
source=(
  "${pkgname}::git+${url}.git"
)
md5sums=('SKIP')
build() (
    cd smatrix
    cargo build --release
)
package() (
    install -D -m 755 ${srcdir}/smatrix/target/release/smatrix ${pkgdir}/usr/bin/$pkgname
)