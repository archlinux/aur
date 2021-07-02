# Contributor: taotieren <admin@taotieren.com>

pkgname=fantascene-dynamic-wallpaper
pkgver=1.1.1
pkgrel=1
pkgdesc="动态壁纸"
arch=('x86_64')
url="https://github.com/dependon/fantascene-dynamic-wallpaper"
license=('GPLv3')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git)
#replaces=(${pkgname})
depends=( 'qt5-tools' 'qt5-webengine' 'dtkwidget' 'dtkgui' 'mpv')
makedepends=('qconf')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('097048b5763ba98fc010ede4333bbe0cbaa53abe7c6d928b62f2015d000204d8')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
#     qmake ./${pkgname}.pro -spec linux-g++ CONFIG+=qtquickcompiler -o build/
#     make -C ./build
    qmake ./${pkgname}.pro -spec linux-g++ CONFIG+=qtquickcompiler
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make INSTALL_ROOT="$pkgdir" install
#     install -Dm0755 "${srcdir}/${pkgname}-${pkgver}/build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
#     install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
