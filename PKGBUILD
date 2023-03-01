# Maintainer: Alexis Polti <ArchSegger at gmail dot com>

pkgname=jlink-systemview-target-src
pkgver=3.50
pkgrel=1
epoch=1
pkgdesc="Segger SystemView target src for Linux"
arch=('i686' 'x86_64')
license=('custom')
groups=('jlink')
depends=()
source=("https://www.segger.com/downloads/systemview/SystemView_Src_V${pkgver/./}.zip")
md5sums=('c9042ff789de485a57288aa26f1367a1')
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
