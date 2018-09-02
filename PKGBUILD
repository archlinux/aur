# Maintainer: Jente Hidskes <hjdskes@gmail.com>

pkgname=gcolor3
pkgver=2.3
pkgrel=2
pkgdesc="A simple color selection dialog in GTK3"
arch=('i686' 'x86_64')
url="http://hjdskes.github.io/projects/gcolor3/"
license=('GPL2')
depends=('gtk3' 'hicolor-icon-theme')
makedepends=('meson' 'gnome-common')
conflicts=('gcolor3-git')
source=(https://github.com/Hjdskes/gcolor3/archive/v$pkgver.tar.gz)
sha256sums=('37d668a0dae32a1031a150d680be2c51efce45f5ac3c11fb6c1166449da21ea0')

build() {
    cd "$srcdir"/$pkgname-$pkgver
    meson build --prefix=/usr
    ninja -C build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir" ninja -C build install
}
