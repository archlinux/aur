# Author: Dies <JerryCasiano(at)gmail(dot)com> 
# Maintainer: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>
# Contributor: Guan 'kuno' Qing <neokuno(at)gmail(dot)com>
# Contributor: Guten Ye <ywzhaifei(at)gmail(dot)com>
# Contributor: i_magnific0 <i_magnific0(at)yahoo(dot)com>
# Contributor: Pavlo <pavlofreemen(at)gmail(dot)com>

pkgname=font-manager
pkgver=0.7.2
pkgrel=2
pkgdesc="A simple font management application for GTK+ Desktop Environments"
url="http://fontmanager.github.io/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libgee' 'libxml2' 'sqlite' 'gucharmap' 'file-roller')
makedepends=('intltool' 'yelp-tools' 'gobject-introspection' 'vala')
install=font-manager.install
source=("https://github.com/FontManager/master/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('0d845cc3cd369b60da04d78211146937')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr --disable-schemas-compile
  make -j1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
}
