# Maintainer: Timo Wilken <timo.21.wilken+aur@gmail.com>
pkgname=libdecsync
pkgver=1.9.0
pkgrel=1
pkgdesc='libdecsync is a multiplatform library for synchronizing using DecSync.'
arch=(x86_64)
url='https://github.com/39aldo39/libdecsync'
license=(LGPL2)
depends=(java-runtime-openjdk ncurses5-compat-libs)
optdepends=()
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/39aldo39/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6e1f0dc5fa0917d12943b07984248b045af45ff8f63096c4ccfe9deac7782f32')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    # For some reason, make exits with status 2 even if the build succeeded.
    make || :
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
