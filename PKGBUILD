# Maintainer: Jat <chat@jat.email>

pkgname=obs-multi-rtmp
pkgver=0.2.6
pkgrel=1
pkgdesc='Multiple RTMP outputs plugin'
arch=('x86_64')
url='https://github.com/sorayuki/obs-multi-rtmp'
license=('unknown')
depends=('obs-studio')
makedepends=('cmake')
_obsver=26.1.1
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "obs-studio-${_obsver}.tar.gz::https://github.com/obsproject/obs-studio/archive/${_obsver}.tar.gz")
sha256sums=('9cbc8bac643e11367b88d8eba8ecd84945fa79a7b4d07a98c6f2c2c4d7bbb84f'
            '19f55eac1c315a6101b024b44c858d1254e1a4a38d87d5e9c9a5274cc532a450')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    OBS_SRC_DIR=../obs-studio-${_obsver} ./build_linux.sh
}

package() {
    cp -aT "${srcdir}/${pkgname}-${pkgver}/dist" ${pkgdir}
}
