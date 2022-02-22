# Maintainer: zlsun <zlsun1995 at gmail dot com>
# Contributor: yetist <yetist@gmail.com>

pkgname=lunar-calendar
pkgver=3.0.1
pkgrel=1
pkgdesc="a gtk+ calendar widget for chinese lunar library."
arch=("i686" "x86_64")
url="https://github.com/yetist/lunar-calendar"
license=('GPL2')
depends=('gtk3' 'lunar-date')
makedepends=('gtk-doc' 'ninja' 'meson' 'gobject-introspection' 'vala')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yetist/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0daf47619beb36c6a6c414e3a3aaf9efe0aa35b499ad107a547057bfe8eefbc3')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    meson build -Dprefix=/usr
    ninja -C build
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    DESTDIR="${pkgdir}" ninja install
}
