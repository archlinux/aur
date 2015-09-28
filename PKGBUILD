# Maintainer: Jonathan Lestrelin <jonathan.lestrelin@gmail.com>

pkgname=psdoom-ng
pkgver=20150924
pkgrel=1
pkgdesc="A FPS and operating system process killer (when you kill an enemy, it kills a process) based on psDooM and Chocolate Doom."
arch=('any')
url="https://github.com/keymon/psdoom-ng"
license=('GPL')
depends=('sdl' 'sdl_mixer' 'sdl_net')
optdepends=('freedoom: to get freedoom.wad')
source=("https://github.com/keymon/$pkgname/archive/master.tar.gz")
md5sums=('3a599d4671c37d4f393e988cbf11011a')

build() {
    cd "${pkgname}-master/trunk"
    ./configure --prefix /usr && make
}

package() {
    cd "${pkgname}-master/trunk"
    DESTDIR=${pkgdir} make install
    mv ${pkgdir}/usr/games ${pkgdir}/usr/bin
}
