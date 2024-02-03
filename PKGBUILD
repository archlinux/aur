# Maintainer: mechakotik <mechakotik@gmail.com>

pkgname=rog-daemon
pkgver=1.0.1
pkgrel=1
pkgdesc="Lightweight daemon and CLI to control ASUS ROG/TUF laptops features"
url="https://github.com/mechakotik/rog-daemon"
arch=('x86_64')
license=('GPL')

source=("${pkgname}-${pkgver}::https://github.com/mechakotik/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('547e002bc36a3b493d1636a08bff3c04a2c14d54dc09082ab38eed1764c68cab')

makedepends=(
    'base-devel'
    'meson'
)

build() {
    arch-meson $pkgname-$pkgver build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
