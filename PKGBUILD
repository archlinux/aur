# Maintainer: Jamesits <aur@ciexyz.net>

_pkgname=intel-cmt-cat
pkgname=${_pkgname}
pkgver=24.05
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
sha256sums=('5ed6c712f967f10e4160da72a0e4880caad29795f99c9ae1ce9d5832939705f0')

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
