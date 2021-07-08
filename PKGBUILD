# Contributor: taotieren <admin@taotieren.com>

pkgname=fantascene-dynamic-wallpaper
srcname=fantascene-archLinux-DDE
pkgver=1.1.2
pkgrel=1
pkgdesc="动态壁纸"
arch=('x86_64')
url="https://github.com/dependon/fantascene-archLinux-DDE"
license=('GPLv3')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git)
#replaces=(${pkgname})
depends=( 'qt5-tools' 'qt5-webengine' 'dtkwidget' 'dtkgui' 'mpv' 'fakeroot' 'gcc' )
makedepends=('qconf')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${srcname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0aac054e4a278a403258d92ea933f3fc4e82e53ed087c717596c14a77ae52adb')

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
