# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f38-backgrounds
pkgver=38.0.0
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 38 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('9b5bcfa55f0153ad148e978eb8953f3d4850736a6f0013c7c75b3c78294ff7ac1c59e479397c1c3a912d032ad99680e23bf0edbc6c9b1c6961da32f5bc677c87')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
