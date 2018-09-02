# Maintainer: HRKo <ootaharuki99 at gmail.com>
pkgname='gimp-plugin-tategaki'
pkgver=1.2.1
pkgrel=2
pkgdesc='GIMP で縦書きをするためのプラグイン。'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://reddog.s35.xrea.com/wiki/GIMPで縦書き.html"
license=('GPL2')
depends=('gimp')
makedepends=('intltool')
install=${pkgname}.install
source=("http://reddog.s35.xrea.com/software/tategaki-${pkgver}.tar.xz"
        'gimp-plugin-tategaki.install')
md5sums=('f48b2124884258056a89c0474e9bfdd4'
         '78311da9cecf15f32dda653a7e0ac145')

build() {
    cd "${srcdir}/tategaki-${pkgver}"
    ./configure --prefix=/usr
    make
}

check() {
    cd "${srcdir}/tategaki-${pkgver}"
    make -k check
}

package() {
    cd "${srcdir}/tategaki-${pkgver}"
    make DESTDIR="$pkgdir" install
}
