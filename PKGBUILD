# Maintainer: Daniel Maurice Davis <daniel.maurice.davis@gmail.com>
_program=alpine-make-oci
_coder=DanielDavis5

pkgname="$_program"
pkgver=0.1.0
pkgrel=1
pkgdesc="Creates an OCI compliant Alpine Linux container image."
arch=('any')
source=("https://github.com/$_coder/$_program/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
license=('MIT')
depends=(
    'alpine-make-rootfs'
    'buildah')
makedepends=('meson')

build() {
    cd "$pkgname-$pkgver"
    meson --prefix /usr build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" ninja -C build install
}

md5sums=('7508fb2230fd14cc5e84c9f2586d7f77')
