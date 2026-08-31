# Maintainer: Michal Babik <michal.babik@protonmail.com>

pkgname=wallchanger
pkgver=1.7.0
pkgrel=1
pkgdesc="Automatic wallpaper changer"
arch=('i686' 'x86_64' 'aarch64')
url="https://www.nongnu.org/wallchanger/"
license=('GPL3')
depends=('json-c>=0.12.1' 'gtk3>=3.22.0' 'curl>=7.68.0')
makedepends=('cmake' 'pkgconf')
optdepends=('flickcurl: Flickr support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mi-bb/wallchanger/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('69b871c39bc2c3d284782a4b4bcd0370')
build() {
        cd "$srcdir/$pkgname-$pkgver"
        cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
        cmake --build build
}
package() {
        cd "$srcdir/$pkgname-$pkgver"
        DESTDIR="$pkgdir" cmake --install build
}

