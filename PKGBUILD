# Maintainer: pureboys <yuyuud@yuyuud@gmail.com>

pkgname='kikoplay'
pkgver=0.7.2
pkgrel=1
pkgdesc="linux danmaku player"
arch=('x86_64')
license=('GPL3')
url="https://github.com/Protostars/KikoPlay"
depends=('mpv' 'lua53' 'qhttpengine')
optdepends=('aria2: for downloading')
source=(
   "https://github.com/Protostars/KikoPlay/archive/$pkgver.zip"
)
sha256sums=(
    "01b9a72e429bdb433913743687af130d16ce5714d9a76c5f6fd777eb8fc3b1f0"
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
