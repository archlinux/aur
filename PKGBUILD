# Maintainer: lambdadroid <lambdadroid@gmail.com>
pkgname=me176c-factory
pkgver=r2.c56789c
pkgrel=1
pkgdesc="Factory information loader for ASUS MeMO Pad 7 (ME176C/CX)"
arch=(x86_64)
_repo=linux-me176c
url="https://github.com/me176c-dev/$_repo"
license=('MIT')
makedepends=(meson)
optdepends=('bluez-utils: to set Bluetooth MAC address on boot')
_revision=c56789c7fa5ee9411320a50b21c8b3d98c8de3ac
source=("$url/archive/$_revision.tar.gz")
sha256sums=('094d55e5fdf1c624abe32ce9e929c220a1580b530cb0d4e1649ed556d4f927c1')

build() {
    arch-meson "$_repo-$_revision/factory" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
