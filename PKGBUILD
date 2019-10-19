# Maintainer: pureboys <yuyuud@yuyuud@gmail.com>

pkgname='kikoplay'
pkgver='0.6.0'
pkgrel=1
pkgdesc="linux danmaku player"
arch=('x86_64')
license=('GPL3')
url="https://github.com/Protostars/KikoPlay"
depends=('mpv' 'qt5-base' 'qhttpengine')
makedepends=('make' 'gcc' 'cmake')
source=(
    ${pkgname}-${pkgver}.zip::"https://github.com/Protostars/KikoPlay/archive/${pkgver}.zip"
)
md5sums=(
    "6ba4c585d1cb392750984f04c9d2bb08"
)


build() {
    cd ${srcdir}/KikoPlay-${pkgver}
    sed -i '29i DEFINES += TEXTURE_MAIN_THREAD' KikoPlay.pro 
    qmake 
    make
}

package() {
    mkdir -p ${pkgdir}/usr/bin
    cp ${srcdir}/KikoPlay-${pkgver}/KikoPlay ${pkgdir}/usr/bin
}
