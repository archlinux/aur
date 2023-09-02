# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f38-backgrounds
pkgver=38.1.1
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 38 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
makedepends=('pngquant')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('44942432788bcbba62fd207091ad3c42d7db15586c8b46fb42f0f81b653b27ece10688b464651865517290f9d2cb90ef0e85543e80f9acaeb29d6f3f653dfff8')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
