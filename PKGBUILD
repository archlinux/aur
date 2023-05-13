# Contributor: Dirk Sohler <spam@0x7be.de>
# Maintainer: Dirk Sohler <spam@0x7be.de>
# vim: ts=4:sw=4


_version='1.4-3'
_filename='amidst-minetest-v1-4-3.jar'
_icon='master/src/main/resources/amidst/icon/amidst-128x128.png'
_base='https://github.com/Treer/Amidst-for-Minetest'

# https://raw.githubusercontent.com/Treer/Amidst-for-Minetest/master/src/main/resources/amidst/icon/amidst-128x128.png

pkgname=amidst-for-minetest
pkgver=$(echo ${_version} | sed s/'-'/'.'/g)
pkgrel=1
pkgdesc='“Amidst for Minetest is the Amidst project converted to support Minetest”'

url='https://github.com/Treer/Amidst-for-Minetest'
arch=('any')
license=('GPLv3')
depends=('java-runtime')

source=(
    "${_base}/releases/download/v${_version}/${_filename}"
    "https://raw.githubusercontent.com/Treer/Amidst-for-Minetest/${_icon}"
    "${pkgname}.sh"
)

sha256sums=(
    '885d34aef611fdde3f5a20e430d253c7e98ce4358f72249f8ba57066562bec21'
    'c07e10a062127c89ea4f676b4f9424f81532ded4cc1e4714cb743ab57739127d'
    'f95fe25144314541acfb749137a1ab7e1a56c3cb0c341b1a13eb4f429cae0b6a'
)

pkgver() {
    echo "${_version}" | sed s/'-'/'.'/g
}

package() {
    cd "$srcdir"
    _iconName=$(basename "/${_icon}")
    install -Dm 755 "${_filename}" ${pkgdir}/usr/share/java/${pkgname}.jar
    install -Dm 755 ${_iconName} ${pkgdir}/usr/share/pixmaps/${pkgname}.png
    install -Dm 755 "${pkgname}.sh" ${pkgdir}/usr/bin/${pkgname}
}
