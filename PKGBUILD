# Maintainer: Addison Bean <addisonbean@gmail.com>

pkgname=paperview
pkgver=r15.40162fb
pkgrel=2
pkgdesc='A high performance X11 animated wallpaper setter'
arch=('x86_64')
url='https://github.com/glouw/paperview'
license=('MIT')
depends=('sdl2')
source=("$pkgname-$pkgver::git+https://github.com/glouw/paperview")
sha256sums=("SKIP")

pkgver() {
    cd "$pkgname-$pkgver"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    PREFIX="$pkgdir/usr" make install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
