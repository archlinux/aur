# Maintainer: pureboys <yuyuud@yuyuud@gmail.com>

pkgname='kikoplay'
pkgver=0.7.1
pkgrel=1
pkgdesc="linux danmaku player"
arch=('x86_64')
license=('GPL3')
url="https://github.com/Protostars/KikoPlay"
depends=('mpv' 'lua' 'qhttpengine')
optdepends=('aria2: for downloading')
source=(
   "https://github.com/Protostars/KikoPlay/archive/$pkgver.zip"
)
sha256sums=(
    "eafdefba49fb4ec3a617c10e292729988e03e81d9c35d550a465559ba75303ba"
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
