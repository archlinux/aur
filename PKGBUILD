# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f39-backgrounds
pkgver=39.0.3
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 39 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('b2a471fbef4c5a7e3c271e8e33793b6f4415c930b09290823623786b22a2b9bc3b6040c4efa09928d8135409fb805a1626b6f8f2f9f07def3fde512290a31d78')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
