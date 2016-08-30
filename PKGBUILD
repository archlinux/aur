# Maintainer: SY Zhang <lastavengers@outlook.com>

pkgname=srain
pkgver=0.05
pkgrel=1
pkgdesc="It does not look like a irc client"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/lastavenger/srain"
depends=('gtk3' 'python' 'libircclient' 'curl' 'libnotify')
makedepends=('make' 'gcc' 'pkg-config' 'gettext' 'imagemagick')
conflicts=('srain-git')
provides=('srain')
source=("https://github.com/LastAvenger/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('3f1a5e00f3e580c6ccf86af8d32fd07567c8baea8cceb5c625f28ca159002492')

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
