# Maintainer: Alexis Polti <ArchSegger at gmail dot com>

pkgname=jlink-systemview-target-src
pkgver=3.50a
pkgrel=0
epoch=2
pkgdesc="Segger SystemView target src for Linux"
arch=('i686' 'x86_64')
license=('custom')
groups=('jlink')
depends=()
source=("https://www.segger.com/downloads/systemview/SystemView_Src_V${pkgver/./}.zip")
md5sums=('4dfd87fc14dddd31740835b8bef3f9ff')
url="https://www.segger.com/downloads/free-utilities/#SystemView"

package(){
    # Cleanup
    rm -f cookie
    # Work around a stupid behaviour of Yay
    rm -f $(HOME)/.cache/yay/jlink-systemview-target-src

    # Match package in /opt
    install -dm755 "${pkgdir}/opt/SEGGER/Target-src" \

    # Bulk copy target sources
    cd ${srcdir}
    cp --preserve=mode -r Config Sample SEGGER "${pkgdir}/opt/SEGGER/Target-src"
}
