# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f36-backgrounds
pkgver=36.1.2
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 36 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('be36bfbd1a16e7ceb98afe38ad2f2e2dae7e88ff8d19a636206120b2f248b43a79752c5a90c324ad5f1851961306c13570a1c3325456f2499d609b36db01d4e1')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
