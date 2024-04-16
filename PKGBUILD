# Maintainer: Jamesits <aur@ciexyz.net>

_pkgname=intel-cmt-cat
pkgname=${_pkgname}
pkgver=23.11.1
pkgrel=1
pkgdesc="User space software for Intel(R) Resource Director Technology"
url="https://github.com/intel/intel-cmt-cat"
license=(BSD)
arch=(x86_64)
depends=()
makedepends=(git gcc)
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/intel/intel-cmt-cat/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0c8354397a0b248cb31a4a6f37ce193a60126753e91bd5d32581abf2ad8b9428')

pkgver() {
    echo "$pkgver"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  make PREFIX=/usr/ NOLDCONFIG=y
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make PREFIX="$pkgdir/usr/" NOLDCONFIG=y install
}
