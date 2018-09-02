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
sha256sums=('bb1196207bc1dd884f743f8210f8322282a3400e44e57b1c14f5a0bd04512625')

build() {
    cd "$srcdir"/$pkgname-$pkgver
    meson build --prefix=/usr
    ninja -C build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir" ninja -C build install
}
