# Author: Dies <JerryCasiano(at)gmail(dot)com> 
# Maintainer: Joaquin <joaquingc123 at gmail dot com>
# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>
# Contributor: Guan 'kuno' Qing <neokuno(at)gmail(dot)com>
# Contributor: Guten Ye <ywzhaifei(at)gmail(dot)com>
# Contributor: i_magnific0 <i_magnific0(at)yahoo(dot)com>
# Contributor: Pavlo <pavlofreemen(at)gmail(dot)com>

pkgname=font-manager
pkgver=0.7.3.1
_pkgver=${pkgver%\.1}
pkgrel=1
pkgdesc="A simple font management application for GTK+ Desktop Environments"
url="http://fontmanager.github.io/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libgee' 'libxml2' 'sqlite' 'gucharmap' 'file-roller')
makedepends=('intltool' 'yelp-tools' 'gobject-introspection' 'vala')
source=("https://github.com/FontManager/master/releases/download/${pkgver}/${pkgname}-${_pkgver}.tar.bz2")
sha256sums=('a037078c735375a24d2943ef3b61e4b3244bcc2b2ee94a0672aabd07b434611c')

build() {
  cd ${srcdir}/${pkgname}-${_pkgver}

  ./configure --prefix=/usr --with-file-roller
  make -j1
}

package() {
  cd ${srcdir}/${pkgname}-${_pkgver}

  make DESTDIR=${pkgdir} install
}
