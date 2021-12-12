# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Martin Wimpress <code at flexion dot org>

pkgname=liboobs
pkgver=3.0.0
pkgrel=5
pkgdesc="GObject based interface to system-tools-backends - shared library"
arch=('i686' 'x86_64')
url="https://directory.fsf.org/wiki/Liboobs"
license=('GPL2')
depends=('system-tools-backends')
makedepends=('python')
source=("https://download.gnome.org/sources/${pkgname}/3.0/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('1e7a327df7dcfa30e0cd3e0d2ffcd9a2c91c7870291dd30434b5da907945c00a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --disable-static
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
