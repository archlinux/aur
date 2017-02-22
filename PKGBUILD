# Maintainer: SY Zhang <lastavengers@outlook.com>

pkgname=srain
pkgver=0.05.1
pkgrel=2
pkgdesc="It does not look like a irc client"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/SilverRainZ/srain"
depends=('gtk3' 'python' 'libircclient' 'curl' 'libnotify')
makedepends=('make' 'gcc' 'pkg-config' 'gettext' 'imagemagick')
conflicts=('srain-git')
provides=('srain')
source=("https://github.com/SilverRainZ/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('2c68b500f94b804b44e15588194e03d07e340a95455cac8ad50524a1c21ba2e3')

build() {
    cd ${pkgname}-${pkgver}

    mkdir build || true
    ./configure --prefix=/usr --disable-debug
    make
}

package() {
    cd ${pkgname}-${pkgver}

    make DESTDIR=$pkgdir install
}
