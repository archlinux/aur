# Maintainer: langonginc <langonginc@yeah.net>
pkgname=qtzff
pkgver=1.0.3
pkgrel=1
pkgdesc="Zff game in QT5"
arch=(any)
url="https://github.com/ohzff/qtzff.git"
license=('MIT')
depends=('bash' 'qt5-base' 'make')
makedepends=('gcc' 'git')
source=("git+$url")
md5sums=('SKIP')

build() {
    cd "$pkgname/"
    qmake QtZff.pro
    make
}

package() {
    cd "$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/$pkgname"
    mkdir -p "$pkgdir/usr/share/applications"
    cp QtZff "$pkgdir/usr/bin/qtzff"
    cp qtzff.desktop "$pkgdir/usr/share/applications"
    chmod 755 "$pkgdir/usr/bin/qtzff"
    chmod 755 "$pkgdir/usr/share/applications/qtzff.desktop"
    cp -r * "$pkgdir/usr/share/$pkgname"
}
