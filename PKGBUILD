# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=gohttpserver-bin
_pkgname=${pkgname%-bin}
pkgver=1.3.0
pkgrel=1
pkgdesc="An HTTP Static File Server, write with golang+vue "
arch=("x86_64" "aarch64")
url="https://github.com/codeskyblue/gohttpserver"
license=("MIT")
depends=()
provides=("${_pkgname}")
options=("!strip" "emptydirs")
source_x86_64=("${url}/releases/download/${pkgver}/gohttpserver_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/${pkgver}/gohttpserver_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('9e38d701573217b12952d61effda0ad07768a2f076c172f1240f2727fc398855')
sha256sums_aarch64=('f28e43d3f3ea6015935e32ae44990b6d29ca7f5f33620372eedbf82545e2f17f')
prepare() {
    if [ -d "${srcdir}/build" ]; then
        rm -rf ${srcdir}/build
    fi
    mkdir ${srcdir}/build
    tar -xvf ${srcdir}/gohttpserver_${pkgver}_linux_*.tar.gz -C ${srcdir}/build
}

package() {
    cd ${srcdir}/build/
    install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"
}
