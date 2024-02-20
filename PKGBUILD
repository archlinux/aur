# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f39-backgrounds
pkgver=39.0.5
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 39 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('d843841b30a6c6e9756a909c29ba66fb5ae2719d4f1a8c40dc0d4bc61d0816e145be242cee18bcca1973643407995d920861a00682156b5f72208d3723253723')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
