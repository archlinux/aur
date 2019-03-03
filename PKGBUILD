# Maintainer: lambdadroid <lambdadroid@gmail.com>
pkgname=me176c-factory
pkgver=r4.57390f7
pkgrel=1
pkgdesc="Factory information loader for ASUS MeMO Pad 7 (ME176C(X))"
arch=(x86_64)
_repo=linux-me176c
url="https://github.com/me176c-dev/$_repo"
license=('MIT')
groups=(me176c)
depends=(glibc)
makedepends=(meson)
optdepends=('bluez-utils: to set Bluetooth MAC address on boot')
_revision=57390f7373d4cc95306a61b3c181a694b04c37e3
source=("$url/archive/$_revision.tar.gz")
sha256sums=('f52f95bebc25da9c506d1ad78aa5b923ee9ca8955380aaaa98881f4f973f3ec1')

build() {
    arch-meson "$_repo-$_revision/factory" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
