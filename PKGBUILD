# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f36-backgrounds
pkgver=36.0.0
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 36 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v36.0.0/f36-backgrounds-36.0.0.tar.xz")
b2sums=('34ed77abb18c33366a996fab34732c70810d83c9d5f5d3cd534ee0a5f9766f4c86d8fea37ae10cd91b5ea6370b5c73d18fd55030ca74093f79d268574e8d8c48')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
