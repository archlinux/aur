# Maintainer: m8D2 <omui (at) proton mail (dot) com>

pkgname=f3-qt
pkgver=2.1.0
pkgrel=4
pkgdesc="A simple GUI for F3 - Fight Flash Fraud."
arch=(i686 x86_64)
url="https://github.com/zwpwjwtz/f3-qt"
license=(GPL3)
depends=(f3 qt5-base)
provides=(f3-qt)
conflicts=(f3-qt-git)
source=($pkgname-$pkgver::git+$url#commit=e9c251be6c101f5c636cf5ca8f16943be7ad82e5)
sha256sums=('SKIP')

prepare() {
    cd "$srcdir"/$pkgname-$pkgver
}

build() {
    cd "$srcdir"/$pkgname-$pkgver
    qmake
    make
}

package() {
    cd "$srcdir"/$pkgname-$pkgver
    install -Dm755 "$srcdir"/$pkgname-$pkgver/$pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm644 "$srcdir"/$pkgname-$pkgver/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
