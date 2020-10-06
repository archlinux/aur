# Maintainer: Timo Wilken <timo.21.wilken+aur@gmail.com>
pkgname=libdecsync
pkgver=1.7.1
pkgrel=1
pkgdesc='libdecsync is a multiplatform library for synchronizing using DecSync.'
arch=(x86_64)
url='https://github.com/39aldo39/libdecsync'
license=(LGPL2)
depends=()
optdepends=()
makedepends=(jdk8-openjdk ncurses5-compat-libs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/39aldo39/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('57ec24cb10199e1b8e6eef9f1bb8affe30e97a5b806a1a8f1f25186472b87074')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    # For some reason, make exits with status 2 even if the build succeeded.
    make || :
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
