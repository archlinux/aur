# Maintainer: Voronwe Sul <Voronwe.S@protonmail.com>
# Contributor: Voronwe Sul <Voronwe.S@protonmail.com>

pkgname="gikkon"
pkgver="0.2.0"
pkgrel=1
pkgdesc="Backup tool for configs, which uses git as storage"
arch=("any")
url="https://github.com/bronvic/$pkgname"
license=("MIT")
makedepends=("python-pip" "python-poetry")
depends=("python>=3.9")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7397177bacfe925b7391713abfc957eea68ec76bc3b0fb5027405b1f298d9f34')

build() {
    make --directory="$srcdir/$pkgname-$pkgver" update
    make --directory="$srcdir/$pkgname-$pkgver" build
}

package() {
    make --directory="$srcdir/$pkgname-$pkgver" DESTDIR="$pkgdir" install
    make --directory="$srcdir/$pkgname-$pkgver" clean
}
