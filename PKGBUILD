# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f36-backgrounds
pkgver=36.1.1
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 36 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('48b19c6d03c99da8c65a3bd9e09848886b38b81e8e44e229876609e8eb8ef4b9355abe4f07a4688dcd36239c9ce80caa7fe5f00a6573d00240289aad1b0dc439')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
