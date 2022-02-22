# Maintainer: chaozhi_l <chaozhi_l@foxmail.com>
# Contributor: yetist <yetist@gmail.com>; zlsun <zlsun1995@gmail.com>

pkgname=lunar-date
pkgver=3.0.1
pkgrel=2
pkgdesc="Chinese lunar date library."
arch=("i686" "x86_64")
url="https://github.com/yetist/lunar-date"
license=('GPL2')
depends=('glib2')
makedepends=('ninja' 'meson' 'gobject-introspection' 'vala')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yetist/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('9b33346f2a8190125bdb879dac8afbc1')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    meson build --prefix /usr -Ddocs=true -Dintrospection=true -Dvapi=true -Dtests=true
    ninja -C build/
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    DESTDIR="${pkgdir}" ninja install
}

