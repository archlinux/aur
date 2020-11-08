# Maintainer: Jat <chat@jat.email>

pkgname=obs-multi-rtmp
pkgver=0.2.5.1
pkgrel=1
pkgdesc='Multiple RTMP outputs plugin'
arch=('x86_64')
url='https://github.com/sorayuki/obs-multi-rtmp'
license=('unknown')
depends=('obs-studio')
makedepends=('cmake')
_obsver=26.0.2
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "obs-studio-${_obsver}.tar.gz::https://github.com/obsproject/obs-studio/archive/${_obsver}.tar.gz")
sha256sums=('5ff34f0c791e786727b6c22161cbaf708ba2d3e032bcb5e40d346bac5734a4ed'
            '06eef30156d21f179f590599ab866b7745209045825a3bf8461a85b60d880ed5')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    OBS_SRC_DIR=../obs-studio-${_obsver} ./build_linux.sh
}

package() {
    cp -aT "${srcdir}/${pkgname}-${pkgver}/dist" ${pkgdir}
}
