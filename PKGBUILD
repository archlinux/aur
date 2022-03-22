# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f36-backgrounds
pkgver=36.1.0
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 36 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('d0a1e18c60fffec67f7fd49fee7920169d757c6dd8d39227a5c65051dbdab79f418ec2478dadfb7c96bb887b675003e4dd1bf526524f300b9325ecaa74fc7bfd')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
