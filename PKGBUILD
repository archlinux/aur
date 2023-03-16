# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f37-backgrounds
pkgver=37.0.5
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 37 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('9cdad101aee869e4a4f3132494854c513820b78d1b85350079fae6b6d6f344c2e98e951319cd2cce104344893dd303544e3afb939f7e39af9a659186c95e7a11')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
