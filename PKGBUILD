# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f35-backgrounds
pkgver=35.0.0
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 35 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/archive/refs/tags/v35.0.0.tar.gz")
b2sums=('b33d12ce1307ffe876e3e3a8a05b65bafd923f6953c23ffa170f147ca371d26f0abf9263153734947dcd3a382a135d4603f3a5210b5b477890e7df597903a9f5')

build() {
    cd backgrounds-$pkgver
    make
}

package() {
    cd backgrounds-$pkgver
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
