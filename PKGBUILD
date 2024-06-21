# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=tzupdate
pkgver=3.1.0
pkgrel=1
pkgdesc='Set the system timezone based on IP geolocation'
url=https://github.com/cdown/tzupdate
arch=('x86_64')
options=(!lto)
license=('MIT')
makedepends=('cargo')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('aebf678afd261852bd3ebf4689a9a7382c3e4e43a92864b77cbee2d26ec62e22')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo install --no-track --locked --root "$pkgdir/usr" --path .
}
