# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f37-backgrounds
pkgver=37.0.4
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 37 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('db8812f419b4a020a9b9e4009f2e731b8c5adf8a4dc21ad091fab3da5a0c1758be45b5b6ac2a8011da64905fb33534fc1a3298d33298e25be22eedc194775eb0')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
