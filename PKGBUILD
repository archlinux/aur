# Maintainer: Onur Alp Akin <onralpakin@gmail.com>
pkgname=gnome-zoomer-git
pkgver=1.0
pkgrel=1
pkgdesc="A simple command-line utility to allow custom-increment zooming of the GNOME desktop."
arch=('x86_64' 'i686')
url="https://github.com/fgimian/gnome-zoomer"
license=('MIT')
depends=('dconf')
makedepends=('git' 'gcc')
source=("git+${url}")
md5sums=('SKIP')

build() {
    cd "gnome-zoomer"
    gcc -Wall gnome-zoomer.c $(pkg-config --libs --cflags dconf) -o gnome-zoomer
}

package() {
    cd "gnome-zoomer"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -D -m 0755 gnome-zoomer "${pkgdir}/usr/bin/gnome-zoomer"
}
