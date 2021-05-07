# Maintainer: pureboys <yuyuud@yuyuud@gmail.com>

pkgname='kikoplay'
pkgver=0.8.1
pkgrel=1
pkgdesc="linux danmaku player"
arch=('x86_64')
license=('GPL3')
url="https://github.com/KikoPlayProject/KikoPlay"
depends=('mpv' 'lua53' 'qhttpengine')
optdepends=('aria2: for downloading')
source=(
   "https://github.com/KikoPlayProject/KikoPlay/archive/refs/tags/$pkgver.zip"
)
sha256sums=(
    "5ffab1c412a7eea2c57362450b5fd17bf4df3103eeedd7e674c369a3d06fc6b3"
)


build() {
    cd ${srcdir}/KikoPlay-${pkgver}
    qmake 
    make
}

package() {
    cd "$srcdir/KikoPlay-$pkgver"
    install -Dm644 KikoPlay使用说明.pdf "$pkgdir/usr/share/doc/kikoplay/help.pdf"
    make install INSTALL_ROOT="$pkgdir"
}
