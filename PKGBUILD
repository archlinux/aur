_pkggccver=10.3
_pkgdatever=2021.10
_pkgname="gcc-arm-none-eabi"
pkgname="rt-gcc-arm-none-eabi"
pkgver=10.3.2021.10
pkgrel=5
pkgdesc="RT-Thread 使用的 gcc-arm-none-eabi 工具链!"
arch=("x86_64")
license=("")
url="https://developer.arm.com/downloads/-/gnu-rm"

_pkggccpath=${_pkgname}-${_pkggccver}-${_pkgdatever}

source=(${_pkggccpath}.tar.bz2::https://developer.arm.com/-/media/Files/downloads/gnu-rm/${_pkggccver}-${_pkgdatever}/gcc-arm-none-eabi-${_pkggccver}-${_pkgdatever}-x86_64-linux.tar.bz2)
md5sums=('2383e4eb4ea23f248d33adc70dc3227e')

_root="/opt/rt-thread"
_tools_root="${_root}/tools"
_gnu_gcc_root="${_tools_root}/gnu_gcc"

pkgver() {
    echo ${_pkggccver}.${_pkgdatever}
}

package() {
    options=(!strip)
    install -dm1755 ${pkgdir}${_gnu_gcc_root}/${_pkgname}
    cp -a ${srcdir}/${_pkggccpath}/* ${pkgdir}${_gnu_gcc_root}/${_pkgname}
}
