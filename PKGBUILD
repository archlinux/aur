# Maintainer: Artem Senichev <artemsen@gmail.com>

pkgname=picterm
pkgver=1.1
pkgrel=1
pkgdesc='Preview images in terminal window'
arch=('x86_64')
license=('APACHE')
depends=('libx11')
optdepends=('libjpeg: JPEG images support'
            'libpng: PNG images support'
            'giflib: GIF images support')
url='https://github.com/artemsen/picterm'
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('cfb42757a862eca2d37a3150fda4167b')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package(){
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
