# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=deepin-dock-plugin-pineappledatetime-git
pkgver=r16.97986bc
pkgrel=1
pkgdesc='Simple quick hack to make timedate plugin display year/month/day on efficient mode'
arch=('x86_64')
url='https://github.com/BLumia/dde-dock-pineappledatetime/'
license=('GPLv3')
depends=(
    'deepin-dock'
)
makedepends=(
    'git'
    'cmake'
    'dtkcore'
)
source=(
    'git+https://github.com/BLumia/dde-dock-pineappledatetime.git'
)
md5sums=(
    'SKIP'
)

pkgver() {
    cd ${srcdir}/dde-dock-pineappledatetime

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd ${srcdir}/dde-dock-pineappledatetime

    mkdir -p build
    cd build
    cmake ../
    make
}

package() {
    cd ${srcdir}/dde-dock-pineappledatetime

    install -Dm644 ./libpineappledatetime.so ${pkgdir}/usr/lib/dde-dock/plugins/libpineappledatetime.so
}
