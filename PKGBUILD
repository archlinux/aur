# Maintainer: pureboys <yuyuud@yuyuud@gmail.com>

pkgname='kikoplay'
pkgver=0.8.0
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
    "3e2fca4fbfa1f2b9b3160e07729ce169e0ae2aec5b13911650fc5e8f4c855f7c"
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
