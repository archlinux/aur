# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f35-backgrounds
pkgver=35.0.1
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 35 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v35.0.1/f35-backgrounds-35.0.1.tar.xz")
b2sums=('ab008e499c476bf502535916f2fd6733ce675d6e782eb8be1f6f88388cb5caa39f48583d76cf4026012680b42f9008a4ce66a74b32aefc91ded2850d58bdf2a9')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
