# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=colorhug-client
pkgver=0.2.8
pkgrel=1
pkgdesc="Client tools for ColorHug & ColorHug2"
arch=('x86_64')
url='https://github.com/hughski/colorhug-client'
license=('GPL2')
depends=('colord-gtk')
makedepends=('intltool' 'itstool' 'gobject-introspection' 'libgusb' 'gtk3'
             'docbook-utils' 'docbook-sgml' 'perl-sgmls' 'bash-completion' 'appstream-glib')
source=("https://people.freedesktop.org/~hughsient/releases/${pkgname}-${pkgver}.tar.xz")
sha256sums=('b7787aa58db2dde6a69a13295b98154040a100d8772aac656f3b5ed0bffc0991')

build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr --libexecdir=/usr/lib
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
