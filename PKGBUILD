# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f37-backgrounds
pkgver=37.0.1
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 37 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('eace78c0709e200801bb8c1caa95b5cb22a7486f18c98d7e15d5836d37c2e3600765987812fe878cb3bb8a7d99089e1d2268f8018bd7efb1614b2968b14b4a98')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
