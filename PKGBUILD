# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Giovanni "Talorno" Ricciardi <kar98k.sniper@gmail.com>
# Contributor: Xpander <xpander0@gmail.com>

pkgname=mate-calc
pkgver=1.18.0
pkgrel=1
pkgdesc="Calculator for the Mate desktop environment"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('LGPL' 'GPL')
depends=('gtk3')
makedepends=('flex' 'bison' 'mate-common' 'perl-xml-parser' 'yelp-tools')
options=('!emptydirs')
groups=('mate-extra-gtk3')
conflicts=('galculator' 'mate-calc-git')
replaces=('galculator')
provides=('mate-calc' 'galculator')
source=("http://pub.mate-desktop.org/releases/1.18/${pkgname}-${pkgver}.tar.xz")
sha1sums=('6ae665c68d492ef965d0b7f7bdd0e58318cf75ba')
install=${pkgname}.install

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./autogen.sh \
        --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

sha1sums=('f9f74e5b65c5828249af2ec264099e06ba678209')
