# Maintainer: Sujal Vijayaraghavan

pkgname=matlock
pkgver=1.0.0
pkgrel=5
pkgdesc='Screen lock program for X like in The Matrix (1999)'
arch=('x86_64' 'aarch64')
url="https://github.com/sujaltv/matlock"
license=('MIT')
depends=('libxext' 'libxrandr')
makedepends=('make' 'git')
source=("https://github.com/sujaltv/matlock/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6aebb88e9b0abc763cc4540ed54a4eef947666c5e9bcc6bfedab1a35d9196a2b')

build() {
    cd $pkgname-${pkgver}
    make PREFIX=/usr DESTDIR="$pkgdir" build
}

package() {
    cd $pkgname-${pkgver}
    make PREFIX=/usr DESTDIR="$pkgdir" instal
}
