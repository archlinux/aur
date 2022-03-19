# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f36-backgrounds
pkgver=36.0.2
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 36 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('b14b973c419c443ced0929f455fce6591db933f5c44394fdd12ad28bf68136066b15f0a1da0405e9bb21237d9e73bd54fac47d8d1178d43f412f4f0d3d4c9f23')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
