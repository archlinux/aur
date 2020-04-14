# Maintainer: Devin Pohl <pohl.devin@gmail.com>

pkgname=matrixise
pkgver=2.0.1
pkgrel=1
pkgdesc="Turn anything into 'The Matrix' wallpaper"
arch=('any')
url="https://github.com/Shizcow/matrixise"
license=('GPL2')
depends=('ncurses')
makedepends=('rust' 'git')
source=(
  "${pkgname}::git+${url}.git"
)
md5sums=('SKIP')
build() (
    cd matrixise
    cargo build --release --examples
)
package() (
    install -D -m 755 ${srcdir}/matrixise/target/release/examples/stdin ${pkgdir}/usr/bin/$pkgname
)