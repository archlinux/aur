# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f38-backgrounds
pkgver=38.0.3
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 38 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('209cc64e7b899481202ab86aef3ece90d9767c6da45a6a211c1fea71dcf4233a0f5463947906ad1cc7bd6ed7f0f44608b3a7713324612b07501249732242e4b3')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
