# Maintainer: Sawyer Stephens <sawyer.r.stephens@gmail.com>
pkgname=oip
pkgver=0.05_1~security1210+1
pkgrel=1
pkgdesc='A visualizer to visualize IP traffic between endpoints'
arch=('x86_64')
url='https://github.com/USU-Security/oip'
license=('GPL3')
depends=('sdl' 'freetype2' 'crypto++' 'libpcap' 'sdl_image' 'fontconfig')
makedepends=('git')
source=("oip::git+https://github.com/USU-Security/oip.git")
md5sums=('SKIP')

build() {
    cd ${pkgname}
    autoreconf -vi
    ./configure --prefix=/usr
    make   
}

check() {
    cd ${pkgname}
    make -k check
}

package() {
    cd ${pkgname}
    DESTDIR="$pkgdir" make install
}
