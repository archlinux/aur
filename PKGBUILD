# Maintainer: esclapion <esclapion[at]gmail[dot]com>

pkgname=qtfind
pkgver=1.2
pkgrel=1
pkgdesc="qt5 search tool for pcmanfm-qt"
url="https://forum.manjaro.org/index.php?topic=16371.0"
arch=('x86_64' 'i686')
license=('GPL')
depends=(qt5-base)
optdepends=()
source=("${pkgname}_$pkgver.tar.gz")
md5sums=('84bf3c7ae8ae2f19c494257dfc92baef')

build() {
    cd $srcdir/${pkgname}_$pkgver
    qmake-qt5 QT+=core QT+=widgets
    make
}

package() {
    cd $srcdir/${pkgname}_$pkgver
    install -D ${pkgname} $pkgdir/usr/bin/$pkgname
    install -D ${pkgname}.png $pkgdir/usr/share/pixmaps/${pkgname}.png
    install -D ${pkgname}.desktop $pkgdir/usr/share/file-manager/actions/${pkgname}.desktop
    mkdir -p $pkgdir/usr/lib/${pkgname}_i18n
    install -D ${pkgname}_i18n/*.qm $pkgdir/usr/lib/${pkgname}_i18n
}
