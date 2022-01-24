# Maintainer: Christian Boxdörfer <christian.boxdoerfer@posteo.de>
pkgname=fsearch
_gitname=fsearch
pkgver=0.1.1
pkgrel=1
pkgdesc="A fast graphical file search utility."
arch=('i686' 'x86_64')
url="https://cboxdoerfer.github.io/fsearch"
license=('GPL2')
depends=('gtk3' 'icu' 'pcre')
makedepends=('git' 'meson')
conflicts=('fsearch-git')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/cboxdoerfer/fsearch/archive/$pkgver.tar.gz")
sha256sums=('64a9471b98f83c7f61582fbc063f28f0b1a226803b6d53195d3f996df3d492d5')

build() {
    arch-meson $pkgname-$pkgver build
    meson compile -C build
}

check() {
    meson test -C build
}

package() {
    DESTDIR="$pkgdir" meson install -C build
}
