# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=hasl-hg
pkgver=r34.fa548528b5f7
pkgrel=1
pkgdesc="The Hassle-free Authentication and Security Layer client library"
arch=("x86_64")
url="https://keep.imfreedom.org/hasl/hasl/"
license=('GPL')
depends=(glib2 glibc )
makedepends=(meson ninja mercurial gi-docgen gobject-introspection )
provides=('hasl')
source=("hg+https://keep.imfreedom.org/hasl/hasl")
sha256sums=('SKIP')
pkgver() {
	cd hasl
        printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"

}

build() {
        arch-meson hasl build
	ninja -C build
}

package() {
        DESTDIR="$pkgdir/" ninja -C build install


}

