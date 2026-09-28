# Maintainer: Sujal Vijayaraghavan

pkgname=matlock
pkgver=1.3.4
pkgrel=0
pkgdesc='Screen lock program for X and Wayland like in The Matrix (1999)'
arch=('x86_64' 'aarch64')
url="https://github.com/sujaltv/matlock"
license=('MIT')
depends=('libx11' 'libxext' 'libxrandr' 'libxcrypt' 'wayland' 'libxkbcommon'
    'freetype2' 'fontconfig')
makedepends=('make' 'git' 'wayland-protocols')
backup=('etc/matlock.yaml')
source=("https://github.com/sujaltv/matlock/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1567e4593b2169ded4be9284f7ec61221e6154ad4a46ae6a3611312f34248b3e')

build() {
    cd $pkgname-${pkgver}
    make
}

package() {
    cd $pkgname-${pkgver}
    make PREFIX="$pkgdir/usr" SYSCONFDIR="$pkgdir/etc" instal
}
