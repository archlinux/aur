# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f37-backgrounds
pkgver=37.0.3
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 37 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('c72f06859a880a2ac56276891dad18de350760eda2c43a0a360c6ca815b8fe8ede3c8d28aed96c441d660538feef67a28454283a82f5314fca1a4be3c41d0c1e')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
