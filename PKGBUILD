# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f36-backgrounds
pkgver=36.0.1
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 36 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('a77062166e36d73d9cad67d6a1928199942a409155a941ccb873e584ab590b3be17be309e19b991bb0bc6e53dbe79ee8dc4e92e0207142bf528ab37a72fb42cc')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
