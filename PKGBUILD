# Maintainer: m8D2 <omui (at) proton mail (dot) com>

pkgname=f3-qt
pkgver=2.1.0
pkgrel=2
pkgdesc="A simple GUI for F3 - Fight Flash Fraud."
arch=(i686 x86_64)
url="https://github.com/zwpwjwtz/f3-qt"
license=(GPL3)
makedepends=(qt5-base)
depends=(f3 qt5-base)
provides=(f3-qt)
conflicts=(f3-qt-git)
source=(
    $pkgname-$pkgver::git+https://github.com/zwpwjwtz/f3-qt#commit=e4b846b8977c2727ef534dc8d63b2f288add2801
    https://raw.githubusercontent.com/zwpwjwtz/$pkgname/e4b846b8977c2727ef534dc8d63b2f288add2801/$pkgname.desktop
)
sha256sums=('SKIP'
            '3d537f2319f63e1d68286ea1c27a9178645c1e5232841db2a9841f5e17da4239')

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
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
