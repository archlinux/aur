# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f38-backgrounds
pkgver=38.1.0
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 38 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('f25d9ffd12ccffbbe32859c31f082b1a02968d4cbfd204dc7497f9b1db5277f2f0d9a448bc07fd926c048c9dbc5867bb2988bb1fda5159fde8a3d266c3d8e9c9')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
