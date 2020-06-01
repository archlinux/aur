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
_commit=add82fd759e65b7c87381cd51b47f46c052588c6
_obsver=25.0.8
source=("${url}/archive/${_commit}.tar.gz"
        "obs-studio-${_obsver}.tar.gz::https://github.com/obsproject/obs-studio/archive/${_obsver}.tar.gz")
sha256sums=('34fe3d03571feda37c6aa42037c270c2532e21480dd7235673b2931ee8bd594e'
            'ef1179c23256c312212e3dce9083d4fa67751db05c3001ad824e2b6995943941')

build() {
    cd "${srcdir}/${pkgname}-${_commit}"
    OBS_SRC_DIR=../obs-studio-${_obsver} ./build_linux.sh
}

package() {
    cp -aT "${srcdir}/${pkgname}-${_commit}/dist" ${pkgdir}
}
