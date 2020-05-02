# Maintainer: Timo Wilken <timo.21.wilken+aur@gmail.com>
pkgname=libdecsync
pkgver=1.3.0
pkgrel=1
pkgdesc='libdecsync is a multiplatform library for synchronizing using DecSync.'
arch=(x86_64)
url='https://github.com/39aldo39/libdecsync'
license=(LGPL2)
depends=()
optdepends=()
makedepends=(jdk8-openjdk ncurses5-compat-libs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/39aldo39/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e3c0cda44c2ce25824c4d8ad62432073b44a77efce10b1454b8ba53b3b52da0c')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    # For some reason, make exits with status 2 even if the build succeeded.
    make || :
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
