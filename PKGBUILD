# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Alexis Janon <kardyne -at- gmail -dot- com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Zhukov Pavel <gelios@gmail.com>
# Contributor: Christof Musik <christof@senfdax.de>
# Contributor: Falconindy
pkgname=slurm
pkgver=0.4.4
pkgrel=1
pkgdesc="yet another network load monitor"
url="https://github.com/mattthias/slurm"
license=("GPL2")
arch=('x86_64')
depends=('ncurses')
makedepends=('meson')
source=("${pkgname}-${pkgver}:${url}/archive/upstream/${pkgver}.tar.gz")
sha256sums=('2f846c9aa16f86cc0d3832c5cd1122b9d322a189f9e6acf8e9646dee12f9ac02')

build() {
   arch-meson ${pkgname}-${pkgver} build
   meson compile -C build
}

package() {
   meson install -C build --destdir "$pkgdir"
}
