# Maintainer: Jonathan Lestrelin <jonathan.lestrelin@gmail.com>

pkgname=psdoom-ng
pkgver=2017.10.02.2.3.0.20181228
pkgrel=1
pkgdesc="A FPS and operating system process killer (when you kill an enemy, it kills a process) based on psDooM and Chocolate Doom."
arch=('any')
url="https://github.com/yeoldegrove/psdoom-ng1"
license=('GPL')
depends=('sdl' 'sdl_mixer' 'sdl_net' 'freedoom1')
source=("https://github.com/yeoldegrove/psdoom-ng1/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('bd1af5ae4e21bc76567c89be246424a75826b5c993b16d72668fab30042c59c6')

build() {
    cd "psdoom-ng1-${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure --prefix /usr && make
}

package() {
    cd "${pkgname}-master/trunk"
    DESTDIR=${pkgdir} make install
    mv ${pkgdir}/usr/games ${pkgdir}/usr/bin
}
