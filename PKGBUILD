# Maintainer: Princeton Ferro (prince781) <princetonferro[at]gmail[dot]com>
pkgname=valdo
pkgver=2021.08.31
pkgrel=1
pkgdesc='Create new Vala projects from templates'
arch=('any')
url="https://github.com/prince781/valdo"
license=('LGPL-2.1')
depends=('glib2' 'json-glib>=1.4.4')
makedepends=('vala' 'meson')
optdepends=('git: for creating a new git repo')
source=("https://github.com/prince781/valdo/archive/$pkgver.tar.gz")
sha256sums=('424a1e1b8afeae1576a99b06f12ad44ff587166b070542c4835a3393d73d3594')

build() {
    cd "$pkgname-$pkgver"
    arch-meson build
    ninja -C build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="${pkgdir}" ninja -C build install
}
