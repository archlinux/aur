# Maintainer: Jente Hidskes <hjdskes@gmail.com>

pkgname=gcolor3
pkgver=2.3.1
pkgrel=1
pkgdesc="A simple color selection dialog in GTK3"
arch=('i686' 'x86_64')
url="http://hjdskes.nl/projects/gcolor3/"
license=('GPL2')
depends=('gtk3' 'hicolor-icon-theme')
makedepends=('meson' 'gnome-common')
conflicts=('gcolor3-git')
source=(https://gitlab.gnome.org/World/gcolor3/-/archive/v$pkgver/gcolor3-v$pkgver.tar.gz)
sha256sums=('b99a361d352ded2a7e867e2e6d33df2e03af0bebd4cc5bcd06959389566f9a79')

build() {
    cd "$srcdir"/$pkgname-v$pkgver
    meson build --prefix=/usr
    ninja -C build
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    DESTDIR="$pkgdir" ninja -C build install
}
