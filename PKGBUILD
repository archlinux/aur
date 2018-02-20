# Maintainer: Emiliano Sauvisky <esauvisky@gmail.com>
pkgname=sevensquare-git
pkgver=1.3.10
pkgrel=1
pkgdesc="Android screencast wroted in QT"
arch=('any')
url="https://github.com/yangh/sevensquare/"
license=('GPL2')
depends=('qt4' 'android-tools')
makedepends=('git')
source=('git+https://github.com/yangh/sevensquare.git')
md5sums=('SKIP')

pkgver() {
    cd ${pkgname%-git}
    git describe --tags | sed 's|^v||;s|-|.|g;s|\.[a-z0-9][a-z0-9]*$||'
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    make
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-git}/build/seven-square" \
        "$pkgdir/usr/bin/seven-square"
    install -Dm755 "${srcdir}/${pkgname%-git}/contributes/minigzip" \
        "${pkgdir}/usr/bin/minigzip"
}
