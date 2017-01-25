# $Id: PKGBUILD 131550 2015-04-17 17:12:22Z bgyorgy $
# Contributor:: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Angel Velasquez <angvp@archlinux.org>  
# Contributor: kasa <biuta.jr@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Maintainer: zoe <chp321 at gmail dot com>

pkgname=pywebkitgtk
pkgver=1.1.8
pkgrel=5
pkgdesc="Python2 bindings to the WebKit GTK+ port"
arch=('i686' 'x86_64')
url="http://code.google.com/p/${pkgname}/"
license=('LGPL')
depends=('webkitgtk2' 'pygtk')
options=('!makeflags')
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('158335385354ba38090c9324b37bf225')

build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr PYTHON=python2
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
