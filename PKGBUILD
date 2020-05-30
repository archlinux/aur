# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Helder Bertoldo <helder.bertoldo@gmail.com>

pkgname=regextester
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple regex tester"
arch=('x86_64' 'i686')
url="https://github.com/artemanufrij/regextester"
license=('GPL3')
source=("https://github.com/artemanufrij/${pkgname}/archive/${pkgver}.tar.gz")
depends=('gtk3' 'granite')
makedepends=('meson' 'vala')
provides=("${pkgname}")
conflicts=("${pkgname}")
sha256sums=('a9785c86357288632079bad7d897af7d2216e8ed2fcf6467f9991fd7adb26d3b')

build() {
    cd "${pkgname}-${pkgver}"
    meson build --prefix=/usr
    ninja -C build
}

package() {
    cd "${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C build install
}