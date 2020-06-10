# Maintainer: Jat <chat@jat.email>

pkgname=obs-multi-rtmp
pkgver=0.2.4
pkgrel=1
pkgdesc='Multiple RTMP outputs plugin'
arch=('x86_64')
url='https://github.com/sorayuki/obs-multi-rtmp'
license=('unknown')
depends=('obs-studio')
makedepends=('cmake')
_obsver=25.0.8
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "obs-studio-${_obsver}.tar.gz::https://github.com/obsproject/obs-studio/archive/${_obsver}.tar.gz")
sha256sums=('a038e7708679e9bf8b9e598e8301a377cebff2e67c7ee1b84b7ff38812ecce2f'
            'ef1179c23256c312212e3dce9083d4fa67751db05c3001ad824e2b6995943941')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    OBS_SRC_DIR=../obs-studio-${_obsver} ./build_linux.sh
}

package() {
    cp -aT "${srcdir}/${pkgname}-${pkgver}/dist" ${pkgdir}
}
