# Maintainer: James Swineson <jamesswineson@gmail.com>

_pkgname=intel-cmt-cat
pkgname=${_pkgname}
pkgver=23.11
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
source=("https://github.com/intel/intel-cmt-cat/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d0664a2fb2ac4d27955d1b12028f88794b92bf7b4370fb1571219a300440bdd0')

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
