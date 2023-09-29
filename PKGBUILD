# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f39-backgrounds
pkgver=39.0.4
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 39 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('89106f86da9b4db629d9b3bc7fa9a8781f964bdf142c5eb0a03864c69d3f5078474282af540e79cbc3e4eede90f5542ad04cefb2bc1dba507084e0645cf5eb03')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
