# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f37-backgrounds
pkgver=37.0.2
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 37 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('77a8bd3e385c8cbb783f4210e03f60c8ed99504688c55bcfad7c7811f43b678f186ceb7df470d2351ae6a5fa44d8b40eb55c455f5bc70c9ba93555aa7dde90c1')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
