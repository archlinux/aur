# Maintainer: Jat <chat@jat.email>

pkgname=obs-multi-rtmp
pkgver=0.2.7.1
pkgrel=1
pkgdesc='Multiple RTMP outputs plugin'
arch=('x86_64')
url='https://github.com/sorayuki/obs-multi-rtmp'
license=('GPL')
depends=('obs-studio')
makedepends=('cmake')
_obsver="$(obs -V | grep -Eo '[0-9.]+')"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "obs-studio-${_obsver}.tar.gz::https://github.com/obsproject/obs-studio/archive/${_obsver}.tar.gz")
sha256sums=('5962afa7df714884c49ab8b48f3b1f8bdc7efa57c54da802ca259ee9d1a9d664'
            'SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    OBS_SRC_DIR=../obs-studio-${_obsver} ./build_linux.sh
}

package() {
    cp -aT "${srcdir}/${pkgname}-${pkgver}/dist" ${pkgdir}
}
