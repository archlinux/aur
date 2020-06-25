# Maintainer: Artem Senichev <artemsen@gmail.com>

pkgname=picterm
pkgver=1.0
pkgrel=1
pkgdesc='Preview images in terminal window'
arch=('x86_64')
license=('APACHE')
makedepends=('autoconf-archive')
depends=('libx11')
optdepends=('libjpeg: JPEG images support'
            'libpng: PNG images support'
            'giflib: GIF images support')
url='https://github.com/artemsen/picterm'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('34b1cab4c5b9109df798de4a57e1fa76')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    autoreconf -fi
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package(){
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
