# Maintainer: Timo Wilken <timo.21.wilken+aur@gmail.com>
pkgname=libdecsync
pkgver=1.6.1
pkgrel=1
pkgdesc='libdecsync is a multiplatform library for synchronizing using DecSync.'
arch=(x86_64)
url='https://github.com/39aldo39/libdecsync'
license=(LGPL2)
depends=()
optdepends=()
makedepends=(jdk8-openjdk ncurses5-compat-libs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/39aldo39/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a732563a584bd4f6e6ede14d050af7eb336aee5c4bf7a3c05f2c38821dbefef6')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    # For some reason, make exits with status 2 even if the build succeeded.
    make || :
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
