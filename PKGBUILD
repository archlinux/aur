# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f38-backgrounds
pkgver=38.0.1
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 38 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('8a0bfbb6ce1898488cd929a79cc65a457c31ecc91e8d5f92d3161a3b6c245a1f67155fc2f0d835c548a200afc03279c36219798ce911185f3fbdf7ec3a25fe39')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
