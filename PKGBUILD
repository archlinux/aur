# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f35-backgrounds
pkgver=35.0.0
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 35 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v35.0.0/f35-backgrounds-35.0.0.tar.xz")
b2sums=('1838a7776e8626f7ecf8997f5a1e89475ab009824d9b1793d4bee0ee2484220ba5c2cea2bbb1e5073db361b517e48b6f684297c7771daa9f2925ecaa18dbb2c2')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
