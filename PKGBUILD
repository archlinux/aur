# Maintainer: lambdadroid <lambdadroid@gmail.com>
pkgname=me176c-factory
pkgver=r2.ba03602
pkgrel=1
pkgdesc="Factory information loader for ASUS MeMO Pad 7 (ME176C/CX)"
arch=(x86_64)
_repo=linux-me176c
url="https://github.com/me176c-dev/$_repo"
license=('MIT')
makedepends=(meson)
optdepends=('bluez-utils: to set Bluetooth MAC address on boot')
_revision=ba036028458d7b14658554680fb7108fb3d77349
source=("$url/archive/$_revision.tar.gz")
sha256sums=('72716e4e9c697e82d80016cd5b5914b7ff140ed2da536a53e601d47f760d804f')

build() {
    arch-meson "$_repo-$_revision/factory" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
