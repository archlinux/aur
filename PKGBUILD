# Maintainer: petRUShka <petrushkin@yandex.ru>
# CO-Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=diorite
pkgver=4.7.0
pkgrel=2
pkgdesc="Diorite Library is a utility and widget library for Nuvola Player project based on GLib, GIO and GTK."
arch=("any")
url="https://github.com/tiliado/diorite"
license=('custom:BSD')
depends=('python' 'vala' 'glib2' 'ruby-gio2' 'gtk3' 'sqlite' 'gobject-introspection')
optdepends=('valadoc:        A documentation tool for vala')
makedepends=('scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('a57039cfd9f75a217f39079a31a664d209169db5d60faff67a0018bf0547bd02')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./waf configure --prefix=/usr --libdir=/usr/lib --novaladoc
    ./waf build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./waf install --destdir=${pkgdir}
}
