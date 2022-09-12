# Maintainer: Stein Gunnar Bakkeby <bakkeby@gmail.com>
pkgname="encircle"
_pkgname=encircle
pkgver="1.0"
pkgrel=1
pkgdesc="A Xinerama X cursor monitor wrapper"
url="https://github.com/bakkeby/encircle"
arch=("any")
license=('MIT')
depends=('libxinerama' 'libxi')
makedepends=('git' 'make')
source=(git+https://github.com/bakkeby/encircle.git)
sha256sums=('SKIP')

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    #make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm755 encircle "$pkgdir/usr/bin/encircle"
    install -Dm644 encircle.1 "$pkgdir/usr/share/man/man1/encircle.1"
    sed -i "s/VERSION/1.0/g" "$pkgdir/usr/share/man/man1/encircle.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
