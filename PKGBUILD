# Maintainer: zlsun <zlsun1995 at gmail dot com>
# Contributor: yetist <yetist@gmail.com>

pkgname=lunar-calendar
pkgver=3.0.0
pkgrel=4
pkgdesc="a gtk+ calendar widget for chinese lunar library."
arch=("i686" "x86_64")
url="https://github.com/yetist/lunar-calendar"
license=('GPL2')
depends=('gtk3' 'lunar-date')
makedepends=('gtk-doc' 'ninja' 'meson' 'gobject-introspection' 'vala')
source=("https://github.com/Chao-zhi/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f3ade207cea7df9a22ac1b711d7b7afd6921a0d21c651170356d9e1720d1bffa')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    meson build -Dprefix=/usr -Denable_gtk_modules=true
    ninja -C build
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    DESTDIR="${pkgdir}" ninja install
}
