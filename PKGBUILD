# Maintainer: mechakotik <mechakotik@gmail.com>

pkgname=rog-daemon
pkgver=1.0.3
pkgrel=1
pkgdesc="Lightweight daemon and CLI to control ASUS ROG/TUF laptops features"
url="https://github.com/mechakotik/rog-daemon"
arch=('x86_64')
license=('GPL')

source=("${pkgname}-${pkgver}::https://github.com/mechakotik/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1e450d18e0b55e0e0170db8888bbd25d98c67fca25c1414bb8d9524821d17d24')

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
