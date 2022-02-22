# Maintainer: Voronwe Sul <Voronwe.S@protonmail.com>
# Contributor: Voronwe Sul <Voronwe.S@protonmail.com>

pkgname="gikkon"
pkgver="0.1.1"
pkgrel=3
pkgdesc="Backup tool for configs, which uses git as storage"
arch=("any")
url="https://github.com/bronvic/$pkgname"
license=("MIT")
makedepends=("python-pip" "python-poetry")
depends=("python>=3.7.0")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f37f74083bf3b8d5b7a89dc88edcc03c5ad1e080c38de5de0823645a85b9ad62')

build() {
    make --directory="$srcdir/$pkgname-$pkgver" update
    make --directory="$srcdir/$pkgname-$pkgver" build
}

package() {
    make --directory="$srcdir/$pkgname-$pkgver" install
    make --directory="$srcdir/$pkgname-$pkgver" clean
}
