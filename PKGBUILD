# Maintainer: m8D2 <omui (at) proton mail (dot) com>

pkgname=f3-qt
pkgver=2.1.0
pkgrel=6
pkgdesc="A simple GUI for F3 - Fight Flash Fraud."
arch=(i686 x86_64)
url="https://github.com/zwpwjwtz/f3-qt"
license=(GPL3)
depends=(f3 qt6-base)
makedepends=(git)
provides=(f3-qt)
conflicts=(f3-qt-git)
source=($pkgname-$pkgver::git+$url#commit=65d58d07e08a31753162df33eb9b517de66704e0)
sha256sums=('f7bdf322317d946e810648dd3acb662edaedddfa8fb76dab0f89f3ccdc2f8a72')

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
