# Maintainer: mechakotik <mechakotik@gmail.com>

pkgname=rog-daemon
pkgver=1.0.2
pkgrel=1
pkgdesc="Lightweight daemon and CLI to control ASUS ROG/TUF laptops features"
url="https://github.com/mechakotik/rog-daemon"
arch=('x86_64')
license=('GPL')

source=("${pkgname}-${pkgver}::https://github.com/mechakotik/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fc4701b962f5dab681419f351606e82a4f7067bac020f026917422703a95bed7')

makedepends=(
    'gcc'
    'meson'
)

build() {
    arch-meson $pkgname-$pkgver build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
