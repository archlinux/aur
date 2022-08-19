# Maintainer: Campbell Jones <arch at serebit dot com>

pkgname="budgie-clipboard-applet"
pkgver="1.1.0"
pkgrel="3"
pkgdesc="A clipboard manager for Budgie"
arch=('i686' 'x86_64')
url="https://github.com/prateekmedia/${pkgname}"
license=('GPL3')
depends=('budgie-desktop' 'libpeas')
optdepends=('xdotool: For pasting text in active window.')
makedepends=('gobject-introspection' 'meson' 'ninja' 'vala')

source=("${pkgname}-${pkgver}.tar.xz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b638afa717bc3ac0949f4f8b8894e73951046cded6879a51d14e0e3e7c9c1655')

build() {
    arch-meson "$pkgname-$pkgver" build --prefix=/usr --libdir=/usr/lib
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
