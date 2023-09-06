# Maintainer: James Swineson <jamesswineson@gmail.com>

_pkgname=intel-cmt-cat
pkgname=${_pkgname}
pkgver=23.08
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
sha256sums=('09536be12c5658a8ce2f832c45d8eee92cffbf6533a944d0c7f26c5f0a94c910')

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
