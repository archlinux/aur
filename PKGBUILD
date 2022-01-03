# Maintainer: Voronwe Sul <Voronwe.S@protonmail.com>
# Contributor: Voronwe Sul <Voronwe.S@protonmail.com>

pkgname="gikkon"
pkgver="0.1.0"
pkgrel=2
pkgdesc="Backup tool for configs, which uses git as storage"
arch=("any")
url="https://github.com/bronvic/$pkgname"
license=("MIT")
makedepends=("python-pip" "python-poetry")
depends=("python>=3.7.0")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("7ccefb95a9de62d434cb5ace368c9339e3b04e467b7a28a83b97bab282c6dfc2")

build() {
    make --directory="$srcdir/$pkgname-$pkgver" update
    make --directory="$srcdir/$pkgname-$pkgver" build
}

package() {
    make --directory="$srcdir/$pkgname-$pkgver" install
}
