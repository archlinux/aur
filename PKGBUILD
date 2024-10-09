# Maintainer: Alexis Polti <ArchSegger at gmail dot com>

pkgname=jlink-systemview-target-src
pkgver=3.58
pkgrel=0
epoch=4
pkgdesc="Segger SystemView target src for Linux"
arch=('i686' 'x86_64')
license=('custom')
groups=('jlink')
depends=()
source=("https://www.segger.com/downloads/systemview/SystemView_Src_V${pkgver/./}.zip")
md5sums=('4c48e8a7016b01484e3dc3af424ceff8')
url="https://www.segger.com/downloads/free-utilities/#SystemView"

package(){
    # Cleanup
    rm -f cookie

    # Match package in /opt
    install -dm755 "${pkgdir}/opt/SEGGER/Target-src" \

    # Bulk copy target sources
    cd ${srcdir}
    cp --preserve=mode -r Config Sample SEGGER "${pkgdir}/opt/SEGGER/Target-src"
}
