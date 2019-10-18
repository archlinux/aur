# Maintainer: pureboy <yuyuud@yuyuud@gmail.com>

pkgname='KikoPlay'
pkgver='master'
pkgrel=1
pkgdesc="KikoPlay danmark"
arch=('x86_64')
license=('GPL3')
url="https://github.com/Protostars/KikoPlay"
depends=('mpv' 'qhttpengine')
makedepends=('make' 'gcc' 'cmake')
source=(
    ${pkgname}-${pkgver}.zip::"https://github.com/Protostars/KikoPlay/archive/master.zip"
)
md5sums=(
    "743d5cd6cf69ea33c51a0b87625597b4"
)


build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    sed -i '29i DEFINES += TEXTURE_MAIN_THREAD' KikoPlay.pro 
    qmake 
    make
}

package() {
    mkdir -p ${pkgdir}/usr/bin
    cp ${srcdir}/${pkgname}-${pkgver}/KikoPlay ${pkgdir}/usr/bin
}
