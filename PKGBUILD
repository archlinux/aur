# Maintainer: ventusliberum <dafeinayius@gmail.com>

pkgname=deepin.com.qq.qqmusic
pkgver=2.0.0
_pkgver=2.0.0deepin4
pkgrel=2
pkgdesc="Tencent QQMusic Client on Deepin Wine"
arch=('i686' 'x86_64')
url="https://github.com/gorquan/QQMusic"
license=('custom')
depends=('deepin-wine')
source=("https://raw.githubusercontent.com/gorquan/QQMusic/master/${pkgname}_${_pkgver}_i386.deb")
sha256sums=('caaca319d8e153a7062e992008d27affdbdd79c6ef4dd103ac03f0dd5890bd2d')
package() {
    tar xJf data.tar.xz -C "${pkgdir}"
    sed -i '15a\export LC_CTYPE=en_US.UTF-8' "${pkgdir}"/opt/deepinwine/apps/Deepin-QQMusic/run.sh
    sed -i 's/Categories=media;/Categories=AudioVideo;Player;/' "$pkgdir"/usr/share/applications/deepin.com.qq.qqmusic.desktop
}

