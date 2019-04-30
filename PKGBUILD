# Maintainer: petRUShka <petrushkin@yandex.ru>
# CO-Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=diorite
pkgver=4.16.0
pkgrel=1
pkgdesc="Diorite Library is a utility and widget library for Nuvola Player project based on GLib, GIO and GTK."
arch=("any")
url="https://github.com/tiliado/diorite"
license=('custom:BSD')
depends=('python' 'vala' 'glib2' 'ruby-gio2' 'gtk3' 'libgee' 'sqlite' 'gobject-introspection')
optdepends=('valadoc:        A documentation tool for vala')
makedepends=('scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('81c76f4f8816980c0de23a060a41bb4f71861025d550014e60068ac6c2da3c5c')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./waf configure --prefix=/usr --libdir=/usr/lib --no-vala-lint --novaladoc
    ./waf build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./waf install --destdir=${pkgdir}
}
