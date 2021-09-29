# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f35-backgrounds
pkgver=35.0.1
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 35 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v35.0.1/f35-backgrounds-35.0.1.tar.xz")
b2sums=('bb239f0d4f2c3352152005eb31a2173e7a8bb857323c843aef1d1549e8c31d6b6d35b25a83d7969f6ebd63fa0e934c2a2cad13952b83ccb76467c4ac451710ff')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
