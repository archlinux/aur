# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f39-backgrounds
pkgver=39.0.2
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 39 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('038630c68891ba49089da42e48f1417374e1c6cbc628af44f88a48d5d76d0d26c435bc072fc1fcb8af92eed1a75d05b184043a2301ffe3898d8500f985596221')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
