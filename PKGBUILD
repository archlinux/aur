# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Qwen 3.6 (Alibaba).

pkgname=umodel
_commit=ue4.27
pkgver=4.27
pkgrel=1
pkgdesc="Unreal Engine model viewer (UEViewer)"
arch=('x86_64')
url="https://github.com/gildor2/UEViewer"
license=('MIT')
depends=('sdl2' 'zlib' 'libpng' 'glibc')
makedepends=('gcc' 'perl' 'git')
provides=('ueviewer')
options=('!debug' '!strip')

source=("${pkgname}::git+https://github.com/gildor2/UEViewer.git#tag=${_commit}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    chmod +x build.sh
    ./build.sh
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 "umodel" "${pkgdir}/usr/bin/umodel"
    # LICENSE.txt отсутствует в теге ue4.27
}
