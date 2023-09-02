# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f39-backgrounds
pkgver=39.0.1
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 39 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('3a7e28bf90c3145a0438a4e06d62b3e70260542192543f35951e1b2013981b2360b7136f072b1025105bd4ffba462f13b29f7b4e6b7a26b70f381168ec4950fc')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
