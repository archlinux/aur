# Contributor: taotieren <admin@taotieren.com>

pkgname=fantascene-dynamic-wallpaper
srcname=fantascene-dynamic-wallpaper
pkgver=1.3.0
pkgrel=1
pkgdesc="动态壁纸"
arch=('x86_64')
url="https://github.com/dependon/fantascene-dynamic-wallpaper"
license=('GPLv3')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git)
#replaces=(${pkgname})
depends=( 'emby-theater' 'libgl' 'glib2' 'glibc' 'gcc' 'mpv' 'ffmpeg' 'fakeroot' 'libxrender' 'libx11' 'libxext' 'libxrender' 'qt5-tools' 'qt5-base' 'qt5-declarative' 'qt5-location' 'qt5-x11extras' 'qt5-webengine' 'xcb-util-wm')
makedepends=('git' 'qconf')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${srcname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${srcname}-${pkgver}"
#     qmake ./${pkgname}.pro -spec linux-g++ CONFIG+=qtquickcompiler -o build/
#     make -C ./build
    qmake ./${pkgname}.pro -spec linux-g++ CONFIG+=qtquickcompiler
    make
}

package() {
    cd "${srcdir}/${srcname}-${pkgver}"
    make INSTALL_ROOT="$pkgdir" install
#     install -Dm0755 "${srcdir}/${pkgname}-${pkgver}/build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
#     install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
